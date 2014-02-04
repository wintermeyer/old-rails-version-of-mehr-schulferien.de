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

  def long_weekend_public_holiday_vacation_periods(month = nil)
    if month.nil? || month.class != Month
      nil
    else
      result_ids = []
      self.public_holiday_vacation_periods(month).each do |vacation_period|
        if vacation_period.start_date == vacation_period.end_date
          if !Day.where(value: vacation_period.start_date).first.is_weekend?
            if Day.where(value: vacation_period.start_date + 1.day).first.is_weekend? || 
               Day.where(value: vacation_period.start_date - 1.day).first.is_weekend?
               result_ids << vacation_period.id
            end
          end
        end
      end
      VacationPeriod.where(id: result_ids).uniq
    end
  end

  def long_weekends(month = nil)
    if month.nil? || month.class != Month
      nil
    else
      results = []
      self.long_weekend_public_holiday_vacation_periods(month).each do |vacation_period|
        if Day.where(value: (vacation_period.start_date + 1.day)).first.is_weekend?
          i = 1
          while Day.where(value: (vacation_period.start_date + i.days)).first.is_weekend? || 
                Day.where(value: (vacation_period.start_date + i.days)).first.is_public_holiday?(self)
            i += 1
          end
          i -= 1
          if Day.where(value: (vacation_period.start_date)).first != Day.where(value: (vacation_period.start_date + i.days)).first
            results << [Day.where(value: (vacation_period.start_date)).first, Day.where(value: (vacation_period.start_date + i.days)).first]
          end
        end

        if Day.where(value: (vacation_period.start_date - 1.day)).first.is_weekend?
          i = 1
          while Day.where(value: (vacation_period.start_date - i.days)).first.is_weekend? || 
                Day.where(value: (vacation_period.start_date - i.days)).first.is_public_holiday?(self)
            i -= 1
          end
          i += 1
          if Day.where(value: (vacation_period.start_date)).first != Day.where(value: (vacation_period.start_date - i.days)).first
            results << [Day.where(value: (vacation_period.start_date - i.days)).first, Day.where(value: (vacation_period.start_date)).first]
          end
        end        
      end
      results.uniq
    end
  end

end
