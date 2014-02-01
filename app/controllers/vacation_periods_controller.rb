class VacationPeriodsController < ApplicationController
  before_action :set_vacation_period, only: [:show, :edit, :update, :destroy]

  # GET /vacation_periods
  # GET /vacation_periods.json
  def index
    @vacation_periods = VacationPeriod.all
  end

  # GET /vacation_periods/1
  # GET /vacation_periods/1.json
  def show
    @months = Month.where(id: Day.where(value: (@vacation_period.start_date .. @vacation_period.end_date)).pluck(:month_id).uniq)

    if @vacation_period.vacation_periodable.class == FederalState
      cookies[:last_federal_state] = @vacation_period.vacation_periodable.slug
    end

    expires_in 1.day, :public => false
    fresh_when etag: [@vacation_period]
  end

  # GET /vacation_periods/new
  def new
    @vacation_period = VacationPeriod.new
  end

  # GET /vacation_periods/1/edit
  def edit
  end

  # POST /vacation_periods
  # POST /vacation_periods.json
  def create
    @vacation_period = VacationPeriod.new(vacation_period_params)

    respond_to do |format|
      if @vacation_period.save
        format.html { redirect_to @vacation_period, notice: 'Vacation period was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vacation_period }
      else
        format.html { render action: 'new' }
        format.json { render json: @vacation_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacation_periods/1
  # PATCH/PUT /vacation_periods/1.json
  def update
    respond_to do |format|
      if @vacation_period.update(vacation_period_params)
        format.html { redirect_to @vacation_period, notice: 'Vacation period was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vacation_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacation_periods/1
  # DELETE /vacation_periods/1.json
  def destroy
    @vacation_period.destroy
    respond_to do |format|
      format.html { redirect_to vacation_periods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation_period
      @vacation_period = VacationPeriod.where(slug: params[:id]).first || VacationPeriod.where(id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacation_period_params
      params.require(:vacation_period).permit(:start_date, :end_date, :vacation_periodable_type, :vacation_periodable_id, :vacation_type_id, :description, :state)
    end
end
