class CitiesController < ApplicationController
  caches_page :show

  before_action :set_city, only: [:show, :edit, :update, :destroy]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @federal_state = @city.federal_state
    @religions = @federal_state.events.where.not(religion: nil).map{|e| e.religion}.uniq

    # The months beginning by the current one
    # until end of next year.
    #
    year = Year.find_by_value(Date.today.year)
    current_month = Month.find_by_value_and_year_id(Date.today.month, year.id)
    @months = Month.where(year_id: [year, Year.find_by_value(year.value + 1)]).where(id: current_month.id..Month.last.id).order(:year_id).order(:value)

    # Render html_description
    #
    @html_description = "Nächste Ferientermine: "

    next_events = @federal_state.events.where(event_type: EventType.find_by_name('Ferien')).where(starts_on: (Date.today..Date.today+18.months)).order(:starts_on).limit(6)

    @html_description += next_events.map{|event| "#{event.summary} #{I18n.l(event.starts_on, format: :short).strip} - #{I18n.l(event.ends_on, format: :short).strip} (#{event.total_number_of_non_school_days(@federal_state)} Tage)"}.join(', ')

    # render html_title
    #
    @html_title = "Schulferien #{@city} (#{@federal_state})"

    # Caching
    #
    expires_in (Time.now.end_of_month - Time.now).to_i.seconds, public: true
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name, :slug, :zip_code, :federal_state_id)
    end
end
