class Day < ActiveRecord::Base
  extend FriendlyId
  friendly_id :day_of_month_for_slug, :use => :scoped, :scope => :month

  belongs_to :month, touch: true
  has_many :slots

  validates :month_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :month,
            presence: true

  validates :value,
            presence: true,
            uniqueness: true

  before_validation :create_parent_year
  after_validation :set_wday

  def to_s
    day_of_month.to_s
  end

  def is_weekend?
    if WEEKEND_WDAYS.include?(self.wday)
      true
    else
      false
    end
  end

  def is_vacation?(slotable)
    VacationType.where(id: slotable.slots.where(day_id: self.id).pluck(:vacation_type_id)).
                 where(public_holiday: false).
                 any?
  end

  def is_public_holiday?(slotable)
    VacationType.where(id: slotable.slots.where(day_id: self.id).pluck(:vacation_type_id)).
                 where(public_holiday: true).
                 any?
  end

  def is_free?(slotable)
    if self.is_weekend? || self.is_public_holiday?(slotable) || self.is_vacation?(slotable)
      true
    else
      false
    end
  end

  def maximum_vacation_length(slotable)
    if self.is_free?(slotable)
      i = 0
      while Day.where(value: (self.value - i.days)).any? && 
                Day.where(value: (self.value - i.days)).first.is_free?(slotable)
        start_date = self.value - i.days
        i += 1
      end

      i = 0
      while Day.where(value: (self.value + i.days)).any? && 
                Day.where(value: (self.value + i.days)).first.is_free?(slotable)
        end_date = self.value + i.days
        i += 1
      end 

      (end_date - start_date).to_i + 1
    else
      0
    end
  end

  private
  def day_of_month_for_slug
    self.value.day
  end

  def create_parent_year
    year = Year.where(value: self.value.year).first_or_create
    month = year.months.where(value: self.value.month).first_or_create
    self.month_id = month.id
  end

  def set_wday
    self.wday = self.value.wday
    self.day_of_month = self.value.day
  end
end
