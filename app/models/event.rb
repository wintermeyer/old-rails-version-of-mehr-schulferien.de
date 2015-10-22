class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true, touch: true
  belongs_to :event_type, touch: true
  belongs_to :religion, touch: true
  has_many :slots, dependent: :destroy
  has_many :days, through: :slots

  # Callbacks
  #
  after_validation :connect_days

  # Validations
  #
  validates :starts_on,
            presence: true

  validates :ends_on,
            presence: true

  validate :ends_on_has_to_be_after_starts_on

  validates :summary,
            presence: true,
            uniqueness: { scope: [:starts_on, :ends_on, :eventable, :event_type, :religion] }

  validates :eventable,
            presence: true

  validates :event_type,
            presence: true

  def to_s
    if starts_on != ends_on
      "#{summary} (#{I18n.l(starts_on, format: :short).strip} - #{I18n.l(ends_on, format: :short).strip})"
    else
      "#{summary} (#{I18n.l(starts_on, format: :short).strip})"
    end
  end

  def total_number_of_non_school_days(federal_state, religion = nil)
    additional_days = 0

    # Check before the event for free days.
    #
    test_date = self.starts_on - 1.day

    while Day.find_by_value(test_date) && !Day.find_by_value(test_date).school_day?(federal_state, religion)
      test_date -= 1.day
      additional_days += 1
    end

    # Check after the event for free days.
    #
    test_date = self.ends_on + 1.day

    while Day.find_by_value(test_date) && !Day.find_by_value(test_date).school_day?(federal_state, religion)
      test_date += 1.day
      additional_days += 1
    end

    return (self.ends_on - self.starts_on).to_i + 1 + additional_days
  end

  private
  def ends_on_has_to_be_after_starts_on
    if ends_on.present? && starts_on.present? && !(ends_on >= starts_on)
      errors.add(:ends_on, "has to be after the start date")
    end
  end

  def connect_days
    (self.starts_on..self.ends_on).to_a.each do |day|
      self.slots.build(day: Day.find_by_value(day))
    end
  end
end
