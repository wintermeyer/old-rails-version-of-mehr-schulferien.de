class Day < ActiveRecord::Base
  belongs_to :month, touch: true
  has_many :slots, dependent: :destroy
  has_many :events, through: :slots

  after_validation :set_wday_any_position

  # Validations
  #
  validates :value,
            presence: true,
            uniqueness: true

  def school_day?(federal_state, religion = nil)
    self.events.where(eventable: federal_state).where(religion: [nil, religion]).none?
  end

  def weekend?
    self.events.where(event_type: EventType.find_by_name('Wochenende')).any?
  end

  def public_holiday?(federal_state)
    self.events.where(eventable: federal_state).where(event_type: EventType.find_by_name('Feiertage')).where(religion: nil).any?
  end

  def to_s
    value.to_s
  end

  private
  def set_wday_any_position
    self.wday = self.value.wday
    case self.wday
    when 0
      self.position = 7
    else
      self.position = self.value.wday
    end
  end
end
