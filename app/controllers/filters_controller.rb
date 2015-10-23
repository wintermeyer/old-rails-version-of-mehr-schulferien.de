class FiltersController < ApplicationController
  caches_page :show

  before_action :set_filter, only: [:show, :edit, :update, :destroy]

  # GET /filters
  def index
    @filters = Filter.all
  end

  # GET /filters/1
  def show
    @religions = @federal_state.events.where.not(religion: nil).map{|e| e.religion}.uniq

    if @filter && @filter.name == 'Invers'
      @modus = 'invers'

      if @year
        # All month of @year plus the first 3 months of the
        # following year.
        #
        @months = Month.where(year_id: [@year, Year.find_by_value(@year.value + 1)]).limit(15)

        # Render html_description
        #
        @html_description = "Planen Sie eine günstige Urlaubsreise mit der umgekehrten Darstellung der Schulferien #{@year} in #{@federal_state}."

        # render html_title
        #
        @html_title = "#{@year}er Schulferien #{@federal_state}"
        @html_title = "Invers-Ansicht #{@html_title}"


      else
        # The months beginning by the current one
        # until end of next year.
        #
        year = Year.find_by_value(Date.today.year)
        current_month = Month.find_by_value_and_year_id(Date.today.month, year.id)
        @months = Month.where(year_id: [year, Year.find_by_value(year.value + 1)]).where(id: current_month.id..Month.last.id)

        # Render html_description
        #
        @html_description = "Planen Sie eine günstige Urlaubsreise mit der umgekehrten Darstellung der Schulferien #{Date.today.year}-#{Date.today.year + 1} in #{@federal_state}."

        # render html_title
        #
        @html_title = "Schulferien #{@federal_state}"
        @html_title = "Invers-Ansicht #{@html_title}"

      end
    end

    if @religion && @html_title
      @html_title += " (#{@religion.name})"
    end


    # # Caching
    # #
    # expires_in (Time.now.end_of_month - Time.now).to_i.seconds, public: true
    # last_update = @federal_state.updated_at.utc
    # fresh_when last_modified: last_update, etag: Digest::MD5.hexdigest(last_update.to_s)
  end

  # GET /filters/new
  def new
    @filter = Filter.new
  end

  # GET /filters/1/edit
  def edit
  end

  # POST /filters
  def create
    @filter = Filter.new(filter_params)

    if @filter.save
      redirect_to @filter, notice: 'Filter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /filters/1
  def update
    if @filter.update(filter_params)
      redirect_to @filter, notice: 'Filter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /filters/1
  def destroy
    @filter.destroy
    redirect_to filters_url, notice: 'Filter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filter
      @filter = Filter.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def filter_params
      params.require(:filter).permit(:name, :slug)
    end
end
