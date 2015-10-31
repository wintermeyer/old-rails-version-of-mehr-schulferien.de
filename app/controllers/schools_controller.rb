class SchoolsController < ApplicationController
  caches_page :show

  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @city = @school.city
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
    @html_description = "Schulferienkalender für #{@school} in #{@city} (#{@federal_state})"

    @html_description += ". Nächste Ferientermine: "

    next_events = @federal_state.events.where(event_type: EventType.find_by_name('Ferien')).where(starts_on: (Date.today..Date.today+18.months)).order(:starts_on).limit(4)

    @html_description += next_events.map{|event| "#{event.summary} #{I18n.l(event.starts_on, format: :short).strip} - #{I18n.l(event.ends_on, format: :short).strip} (#{event.total_number_of_non_school_days(@federal_state)} Tage)"}.join(', ')

    # render html_title
    #
    @html_title = "Schulferienkalender für #{@school} in #{@city} (#{@federal_state})"

    # Caching
    #
    expires_in (Time.now.end_of_month - Time.now).to_i.seconds, public: true
    last_update = [@city.updated_at, @federal_state.updated_at].sort.last.utc
    fresh_when last_modified: last_update, etag: Digest::MD5.hexdigest(last_update.to_s)
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :slug, :city_id, :address_line1, :address_line2, :street, :zip_code, :address_city_name, :phone_number, :fax_number, :email, :homepage)
    end
end
