class SpecialCalendarsController < ApplicationController
  def inverse
    # The months beginning by the current one
    # until end of next year.
    #
    year = Year.find_by_value(Date.today.year)
    current_month = Month.find_by_value_and_year_id(Date.today.month, year.id)
    @months = Month.where(year_id: [year, Year.find_by_value(year.value + 1)]).where(id: current_month.id..Month.last.id)

    @html_description = "Ein inverser Schulferienkalender der bis Ende #{Date.today.year + 1} alle Tage aufzeigt, an denen es in keinem Bundesland Schulferien gibt. Dies ist die günstigste Reisezeit für alle die nicht während Schulferien verreisen müssen."

    # render html_title
    #
    @html_title = "Inverser Schulferienkalender #{Date.today.year}-#{Date.today.year + 1} => Die günstigste Reisezeit."

    # Caching
    #
    # expires_in (Time.now.end_of_month - Time.now).to_i.seconds, public: true
    # last_update = @federal_state.updated_at.utc
    # fresh_when last_modified: last_update, etag: Digest::MD5.hexdigest(last_update.to_s)
  end

  def brueckentage
  end
end
