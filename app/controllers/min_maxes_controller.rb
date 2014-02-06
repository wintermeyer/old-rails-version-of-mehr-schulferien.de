class MinMaxesController < ApplicationController
  before_filter :set_federal_state, only: [:show]
  before_filter :set_year, only: [:show]
  before_action :set_min_max, only: [:show, :edit, :update, :destroy]

  # GET /min_maxes
  def index
    @min_maxes = MinMax.all
  end

  # GET /min_maxes/1
  def show
    @months = @year.months

    # Search the public holidays for Germany and 
    # for the given @federal_state
    #
    public_holiday_slots = @federal_state.slots.where(vacation_type_id: VacationType.where(public_holiday: true)).where(day_id: Day.where(month_id: @year.months.pluck(:id)).pluck(:id))
    public_holiday_days = Day.where(id: public_holiday_slots.pluck(:day_id))

    bundesweite_public_holiday_days_ids = []
    public_holiday_days.each do |day|
      if Slot.where(slotable_type: 'FederalState').where(day_id: day.id).where(vacation_type_id: VacationType.where(public_holiday: true).pluck(:id)).count == 16
        bundesweite_public_holiday_days_ids << day.id
      end
    end
    @public_holiday_days = public_holiday_days.where(id: bundesweite_public_holiday_days_ids).order(:value)

    @federal_state_public_holiday_days = @federal_state.days.where(id: Slot.where(vacation_type_id: VacationType.where(public_holiday: true)).pluck(:day_id)).
                                                             where(id: Day.where(month_id: @year.months.pluck(:id))).
                                                             where.not(id: @public_holiday_days.pluck(:id)).order(:value)

    # Search the weekends
    #
    @weekend_days = Day.where(month_id: Month.where(year_id: @year.id).pluck(:id)).where(wday: [0,6]).order(:value)

    # Lets loop through all months and see which ones 
    # are best.
    #
    sort_me = []
    @year.months.order(:value).each do |month|
      number_of_days = month.days.count
      number_of_workdays = (month.days.where.not(id: @weekend_days.pluck(:id)).
                                      where.not(id: @federal_state_public_holiday_days.pluck(:id)).
                                      where.not(id: @public_holiday_days.pluck(:id))).count
      percentage_of_workdays = ((number_of_workdays.to_f / number_of_days.to_f) * 100)
      sort_me.push({month: month, percentage_of_workdays: percentage_of_workdays})
    end
    
    sorted_months = (sort_me.sort_by { |k| k[:percentage_of_workdays] }).map{|k| k[:month]}

    best_month_ids = []
    number_of_available_vacation_days = @min_max.number_of_vacation_days
    sorted_months.each do |month|
      if number_of_available_vacation_days > 0
        number_of_days = month.days.count
        number_of_workdays = (month.days.where.not(id: @weekend_days.pluck(:id)).
                                        where.not(id: @federal_state_public_holiday_days.pluck(:id)).
                                        where.not(id: @public_holiday_days.pluck(:id))).count
        number_of_available_vacation_days -= number_of_workdays
        best_month_ids << month.id
      end
    end
    @months = @year.months.where(id: best_month_ids).order(:value)

    cookies[:number_of_vacation_days] = @min_max.number_of_vacation_days

    if flash.none?
      expires_in 1.hour, :public => false
      fresh_when etag: [current_user, @federal_state, @year, @min_max]
    end
  end

  # GET /min_maxes/new
  def new
    @min_max = MinMax.new
  end

  # GET /min_maxes/1/edit
  def edit
  end

  # POST /min_maxes
  def create
    @min_max = MinMax.new(min_max_params)

    if @min_max.save
      redirect_to @min_max, notice: 'Min max was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /min_maxes/1
  def update
    if @min_max.update(min_max_params)
      redirect_to @min_max, notice: 'Min max was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /min_maxes/1
  def destroy
    @min_max.destroy
    redirect_to min_maxes_url, notice: 'Min max was successfully destroyed.'
  end

  private
    def set_federal_state
      if params[:federal_state_id]
        @federal_state = FederalState.where(id: params[:federal_state_id]).first
        if @federal_state.nil?
          @federal_state = FederalState.where(slug: params[:federal_state_id]).first
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_year
      if params[:year_id]
        @year = available_years.where(id: params[:year_id]).first
        if @year.nil?
          @year = available_years.where(slug: params[:year_id]).first
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_min_max
      @min_max = MinMax.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def min_max_params
      params.require(:min_max).permit(:number_of_vacation_days, :slug)
    end
end
