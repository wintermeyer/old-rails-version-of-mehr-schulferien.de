class SpecialCalendarsController < ApplicationController
  caches_page :inverse
  caches_page :index

  def index
    # Caching
    #
    expires_in (Time.now.end_of_month - Time.now).to_i.seconds, public: true
  end

  def inverse
    # The months beginning by the current one
    # until end of next year.
    #
    year = Year.find_by_value(Date.today.year)
    current_month = Month.find_by_value_and_year_id(Date.today.month, year.id)
    @months = Month.where(year_id: [year, Year.find_by_value(year.value + 1)]).where(id: current_month.id..Month.last.id).order(:year_id).order(:value)

    @html_description = "Ein inverser Schulferienkalender der bis Ende #{Date.today.year + 1} alle Tage aufzeigt, an denen es in keinem Bundesland Schulferien gibt. Dies ist die günstigste Reisezeit für alle die nicht während Schulferien verreisen müssen."

    # render html_title
    #
    @html_title = "Inverser Schulferienkalender #{Date.today.year}-#{Date.today.year + 1} => Die günstigste Reisezeit."

    # Caching
    #
    expires_in (Time.now.end_of_month - Time.now).to_i.seconds, public: true
  end

  def brueckentage
  end
end
