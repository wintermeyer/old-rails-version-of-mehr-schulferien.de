class FederalStatesController < ApplicationController
  caches_page :show

  before_action :set_federal_state, only: [:show, :edit, :update, :destroy]

  # GET /federal_states
  # GET /federal_states.json
  def index
    @federal_states = FederalState.all
  end

  # GET /federal_states/1
  # GET /federal_states/1.json
  def show
    @religions = @federal_state.events.where.not(religion: nil).map{|e| e.religion}.uniq

    # The months beginning by the current one
    # until end of next year.
    #
    year = Year.find_by_value(Date.today.year)
    current_month = Month.find_by_value_and_year_id(Date.today.month, year.id)
    @months = Month.where(year_id: [year, Year.find_by_value(year.value + 1)]).where(id: current_month.id..Month.last.id).order(:year_id).order(:value)

    # Set a modus
    #
    if params[:modus]
      @modus = params[:modus]
    end

    # Render html_description
    #
    if @modus == 'invers'
      @html_description = "Planen Sie eine günstige Urlaubsreise mit der umgekehrten Darstellung der Schulferien #{Date.today.year}-#{Date.today.year + 1} in #{@federal_state}."
    else
      @html_description = "Nächste Ferientermine: "

      next_events = @federal_state.events.where(event_type: EventType.find_by_name('Ferien')).where(starts_on: (Date.today..Date.today+18.months)).order(:starts_on).limit(8)

      @html_description += next_events.map{|event| "#{event.summary} #{I18n.l(event.starts_on, format: :short).strip} - #{I18n.l(event.ends_on, format: :short).strip} (#{event.total_number_of_non_school_days(@federal_state)} Tage)"}.join(', ')
    end

    # render html_title
    #
    @html_title = 'Schulferienkalender '
    @html_title += "#{Date.today.year}-#{Date.today.year + 1} "
    @html_title += "für #{@federal_state}"

    if @modus == 'invers'
      @html_title = "Invers-Ansicht #{@html_title}"
    end
    if @religion
      @html_title += " (#{@religion.name})"
    end

    # Caching
    #
    expires_in (Time.now.end_of_month - Time.now).to_i.seconds, public: true
  end

  # GET /federal_states/new
  def new
    @federal_state = FederalState.new
  end

  # GET /federal_states/1/edit
  def edit
  end

  # POST /federal_states
  # POST /federal_states.json
  def create
    @federal_state = FederalState.new(federal_state_params)

    respond_to do |format|
      if @federal_state.save
        format.html { redirect_to @federal_state, notice: 'Federal state was successfully created.' }
        format.json { render :show, status: :created, location: @federal_state }
      else
        format.html { render :new }
        format.json { render json: @federal_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /federal_states/1
  # PATCH/PUT /federal_states/1.json
  def update
    respond_to do |format|
      if @federal_state.update(federal_state_params)
        format.html { redirect_to @federal_state, notice: 'Federal state was successfully updated.' }
        format.json { render :show, status: :ok, location: @federal_state }
      else
        format.html { render :edit }
        format.json { render json: @federal_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /federal_states/1
  # DELETE /federal_states/1.json
  def destroy
    @federal_state.destroy
    respond_to do |format|
      format.html { redirect_to federal_states_url, notice: 'Federal state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_federal_state
      @federal_state = FederalState.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def federal_state_params
      params.require(:federal_state).permit(:country_id, :name, :slug, :url)
    end
end
