class FederalState < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :country, touch: true
  has_many :slots, as: :slotable, dependent: :destroy
  has_many :days, through: :slots
  has_many :vacation_periods, as: :vacation_periodable, dependent: :destroy
  has_many :cities, dependent: :destroy
  has_many :schools, through: :cities

  validates :country_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :country,
            presence: true            

  validates :name,
            :presence => true,
            uniqueness: { scope: :country }

  def to_s
    name
  end

  def public_holiday_vacation_periods(month = nil)
    if month.nil? || month.class != Month
      nil
    else
      days = self.days.where(month_id: month.id)

      slots = Slot.where(slotable_type: "FederalState", slotable_id: self.id).
              where(vacation_type_id: VacationType.where(public_holiday: true)).
              where(day_id: days.pluck(:id))

      VacationPeriod.where(id: slots.pluck(:vacation_period_id))
    end
  end

  def vacation_periods_for_given_resource(resource = nil)
    self.vacation_periods.where(id: Slot.where(day_id: resource).
                                   where(vacation_type_id: VacationType.
                                   where(public_holiday: false)).
                                   pluck(:vacation_period_id))
  end

end
