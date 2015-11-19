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

    @html_description = "Inverser Schulferienkalender der bis Ende #{Date.today.year + 1} alle Tage aufzeigt, an denen es in keinem Bundesland Schulferien gibt. Dies ist die günstigste Reisezeit für alle die nicht während Schulferien verreisen müssen."

    # render html_title
    #
    @html_title = "Inverser Schulferienkalender #{Date.today.year}-#{Date.today.year + 1} => Die günstigste Reisezeit."

    # Generate an array of good travel periods
    #
    good_days = Day.where(month: @months).order(:value).to_a
    good_days.delete_if{|day| !day.school_day_everywhere? && !(day.weekend? || day.public_holiday_everywhere?) }

    @good_travel_periods = []
    counter = 0
    good_travel_period_start = nil
    good_travel_period_end = nil

    good_days.each_with_index do |good_day, index|
      if good_days[index - 1].try(:value) != good_day.value - 1.day
        if !good_travel_period_end.nil? && counter > 6
          @good_travel_periods << [good_travel_period_start, good_travel_period_end]
        end
        counter = 1
        good_travel_period_start = good_day
        good_travel_period_end = nil
      else
        counter += 1
        if counter > 6
          good_travel_period_end = good_day
        end
      end
    end

    # Two good travel periods might be interupted by a single
    # public holiday. Let's merge them.
    #
    @good_travel_periods.each_with_index do |good_travel_period, index|
      if good_travel_period != @good_travel_periods.first
        if @good_travel_periods[index - 1][1].value + 2.day == good_travel_period[0].value
          @good_travel_periods[index - 1][1] = good_travel_period[1]
          @good_travel_periods.delete_at(index)
        end
      end
    end

    # Caching
    #
    expires_in (Time.now.end_of_month - Time.now).to_i.seconds, public: true
  end

  def brueckentage
  end
end
