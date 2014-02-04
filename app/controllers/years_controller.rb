class YearsController < ApplicationController
  before_action :set_federal_state, only: [:show, :index]
  before_action :set_year, only: [:show, :edit, :update, :destroy]

  # GET /years
  # GET /years.json
  def index
    @years = available_years
  end

  # GET /years/1
  # GET /years/1.json
  def show
    expires_in 1.hour, :public => false
    cookies[:last_federal_state] = @federal_state.slug

    @months = @year.months.order(:value)
    
    if @year && @federal_state
      fresh_when etag: [current_user, @year, @federal_state]
    end
  end

  # GET /years/new
  def new
    @year = Year.new
  end

  # GET /years/1/edit
  def edit
  end

  # POST /years
  # POST /years.json
  def create
    @year = Year.new(year_params)

    respond_to do |format|
      if @year.save
        format.html { redirect_to @year, notice: 'Year was successfully created.' }
        format.json { render action: 'show', status: :created, location: @year }
      else
        format.html { render action: 'new' }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /years/1
  # PATCH/PUT /years/1.json
  def update
    respond_to do |format|
      if @year.update(year_params)
        format.html { redirect_to @year, notice: 'Year was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /years/1
  # DELETE /years/1.json
  def destroy
    @year.destroy
    respond_to do |format|
      format.html { redirect_to years_url }
      format.json { head :no_content }
    end
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
      @year = available_years.where(id: params[:id]).first
      if @year.nil?
        @year = available_years.where(slug: params[:id]).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def year_params
      params.require(:year).permit(:value, :slug)
    end
end
