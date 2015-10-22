class ReligionsController < ApplicationController
  before_action :set_religion, only: [:show, :edit, :update, :destroy]
  before_action :set_federal_state_and_year, only: [:show]

  # GET /religions
  # GET /religions.json
  def index
    @religions = Religion.all
  end

  # GET /religions/1
  # GET /religions/1.json
  def show
    @religions = @federal_state.events.where.not(religion: nil).map{|e| e.religion}.uniq

    if @year
      # All month of @year plus the first 3 months of the
      # following year.
      #
      @months = Month.where(year_id: [@year, Year.find_by_value(@year.value + 1)]).limit(15)
    else
      # The months beginning by the current one
      # until end of next year.
      #
      year = Year.find_by_value(Date.today.year)
      current_month = Month.find_by_value_and_year_id(Date.today.month, year.id)
      @months = Month.where(year_id: [year, Year.find_by_value(year.value + 1)]).where(id: current_month.id..Month.last.id)
    end

    render "years/show"
  end

  # GET /religions/new
  def new
    @religion = Religion.new
  end

  # GET /religions/1/edit
  def edit
  end

  # POST /religions
  # POST /religions.json
  def create
    @religion = Religion.new(religion_params)

    respond_to do |format|
      if @religion.save
        format.html { redirect_to @religion, notice: 'Religion was successfully created.' }
        format.json { render :show, status: :created, location: @religion }
      else
        format.html { render :new }
        format.json { render json: @religion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /religions/1
  # PATCH/PUT /religions/1.json
  def update
    respond_to do |format|
      if @religion.update(religion_params)
        format.html { redirect_to @religion, notice: 'Religion was successfully updated.' }
        format.json { render :show, status: :ok, location: @religion }
      else
        format.html { render :edit }
        format.json { render json: @religion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /religions/1
  # DELETE /religions/1.json
  def destroy
    @religion.destroy
    respond_to do |format|
      format.html { redirect_to religions_url, notice: 'Religion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_religion
      @religion = Religion.friendly.find(params[:id])
    end

    def set_federal_state_and_year
      @federal_state = FederalState.friendly.find(params[:federal_state_id])
      if params[:year_id]
        @year = Year.friendly.find(params[:year_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def religion_params
      params.require(:religion).permit(:name, :slug)
    end
end
