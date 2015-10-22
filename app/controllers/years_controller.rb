class YearsController < ApplicationController
  before_action :set_year, only: [:show, :edit, :update, :destroy]
  before_action :set_federal_state, only: [:show]

  # GET /years
  # GET /years.json
  def index
    @years = Year.all
  end

  # GET /years/1
  # GET /years/1.json
  def show
    @religions = @federal_state.events.where.not(religion: nil).map{|e| e.religion}.uniq

    # All month of @year plus the first 3 months of the
    # following year.
    #
    @months = Month.where(year_id: [@year, Year.find_by_value(@year.value + 1)]).limit(15)

    # Set a modus
    #
    if params[:modus]
      @modus = params[:modus]
    end

    # Caching
    #
    expires_in (Time.now.end_of_month - Time.now).to_i.seconds, public: true
    last_update = [@year.updated_at, @federal_state.updated_at].sort.last.utc
    fresh_when last_modified: last_update, etag: Digest::MD5.hexdigest(last_update.to_s)
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
        format.json { render :show, status: :created, location: @year }
      else
        format.html { render :new }
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
        format.json { render :show, status: :ok, location: @year }
      else
        format.html { render :edit }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /years/1
  # DELETE /years/1.json
  def destroy
    @year.destroy
    respond_to do |format|
      format.html { redirect_to years_url, notice: 'Year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.friendly.find(params[:id])
    end

    def set_federal_state
      @federal_state = FederalState.friendly.find(params[:federal_state_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def year_params
      params.require(:year).permit(:value)
    end
end
