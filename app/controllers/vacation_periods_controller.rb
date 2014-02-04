class VacationPeriodsController < ApplicationController
  before_action :set_school
  before_action :set_vacation_period, only: [:show, :edit, :update, :destroy]

  # GET /vacation_periods
  # GET /vacation_periods.json
  def index
    @vacation_periods = @vacation_periods.all
  end

  # GET /vacation_periods/1
  # GET /vacation_periods/1.json
  def show
    @months = Month.where(id: Day.where(value: (@vacation_period.start_date .. @vacation_period.end_date)).pluck(:month_id).uniq)

    if @vacation_period.vacation_periodable.class == FederalState
      cookies[:last_federal_state] = @vacation_period.vacation_periodable.slug
    end

    expires_in 1.hour, :public => false
    fresh_when etag: [current_user, @vacation_period]
  end

  # GET /vacation_periods/new
  def new
    @vacation_period = @vacation_periods.build
  end

  # GET /vacation_periods/1/edit
  def edit
  end

  # POST /vacation_periods
  # POST /vacation_periods.json
  def create
    @vacation_period = @vacation_periods.build(vacation_period_params)
    if @school
      @vacation_period.vacation_type = VacationType.where(name: 'Beweglicher Ferientag', public_holiday: false).first_or_create

      if @vacation_period.end_date.blank?
        @vacation_period.end_date = @vacation_period.start_date
      end
    end

    respond_to do |format|
      if @vacation_period.save
        format.html { redirect_to @vacation_period, notice: 'Vacation period was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /vacation_periods/1
  # PATCH/PUT /vacation_periods/1.json
  def update
    respond_to do |format|
      if @vacation_period.update(vacation_period_params)
        format.html { redirect_to @vacation_period, notice: 'Vacation period was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /vacation_periods/1
  # DELETE /vacation_periods/1.json
  def destroy
    @vacation_period.destroy
    respond_to do |format|
      format.html { redirect_to vacation_periods_url }
    end
  end

  private
    def set_school
      if params[:school_id]
        @school = School.where(slug: params[:school_id]).first || School.where(id: params[:school_id]).first
      end
      if @school
        @vacation_periods = @school.vacation_periods
      else
        @vacation_periods = VacationPeriod.all
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_vacation_period
      if VacationPeriod.where(slug: params[:id]).any?
        @vacation_period = @vacation_periods.where(slug: params[:id]).first
      else
        @vacation_period = @vacation_periods.where(id: params[:id]).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacation_period_params
      params.require(:vacation_period).permit(:start_date, :end_date, :vacation_periodable_type, :vacation_periodable_id, :vacation_type_id, :description, :state)
    end
end
