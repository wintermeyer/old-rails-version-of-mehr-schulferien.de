class Year < ActiveRecord::Base
  extend FriendlyId
  friendly_id :value

  has_many :months, -> {order('months.value')}, dependent: :destroy
  has_many :days, through: :months
  has_many :events, through: :days

  # Callbacks
  #
  after_validation :create_months_and_days
  after_create :create_weekend_events

  # Validations
  #
  validates :value,
            presence: true,
            uniqueness: true,
            numericality: { only_integer: true, greater_than: 2014 }

  def to_s
    value.to_s
  end

  private
  def create_months_and_days
    (1..12).each do |month_counter|
      month = self.months.build(value: month_counter)
      first_day = Date.parse("#{self.value}-#{month_counter}-01")
      (first_day..first_day.end_of_month).each do |day_value|
        month.days.build(value: day_value)
      end
    end
  end

  def create_weekend_events
    wochenende = EventType.find_by_name('Wochenende')

    # Check if last year's last day is a Saturday.
    # Update weekend Event in case it is.
    #
    last_year = Year.find_by_value(self.value - 1)
    if last_year && last_year.days.last.position == 6
      last_year.events.where(event_type: wochenende).
                       where(starts_on: last_year.days.last.value).
                       where(ends_on: last_year.days.last.value).
                       each do |event|
        event.update_attribute(:ends_on, self.days.first.value)
      end
    end

    self.days.where(position: 6).each do |day|
      if day != self.days.last
        FederalState.all.each do |federal_state|
          event = federal_state.events.create(starts_on: day.value, ends_on: (day.value + 1.day), event_type: wochenende, summary: wochenende.name)
        end
      else
        # In this edge case the 31th of December is a Saturday.
        #
        FederalState.all.each do |federal_state|
          if Day.find_by_value(day.value + 1.day)
            event = federal_state.events.create(starts_on: day.value, ends_on: (day.value + 1.day), event_type: wochenende, summary: wochenende.name)
          else
            event = federal_state.events.create(starts_on: day.value, ends_on: (day.value), event_type: wochenende, summary: wochenende.name)
          end
        end
      end
    end
  end
end
