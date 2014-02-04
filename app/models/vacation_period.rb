class VacationPeriod < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :vacation_type, touch: true
  belongs_to :vacation_periodable, polymorphic: true, touch: true
  has_many :slots, dependent: :destroy
  has_many :days, through: :slots

  validates :start_date,
            presence: true  

  validates :end_date,
            presence: true  

  validates :vacation_type_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :vacation_type,
            presence: true

  validates :vacation_periodable_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :vacation_periodable_type,
            presence: true

  validates :vacation_periodable,
            presence: true

  after_create :create_matching_slots

  def to_s
    "#{self.vacation_type} #{self.start_date.year}"
  end

  def duration
    (self.end_date - self.start_date).to_i + 1
  end

  private
  def create_matching_slots
    (self.start_date .. self.end_date).to_a.each do |new_day|
      day = Day.where(value: new_day).first_or_create
      slot = day.slots.where( vacation_type_id: self.vacation_type.id,
                              vacation_period_id: self.id,
                              slotable: self.vacation_periodable).first_or_create
    end

    # TODO: Fix dirty hack. There seems to be some sort of racing condition. 
    # That's the reason why this method trys to create the slots twice.

    (self.start_date .. self.end_date).to_a.each do |new_day|
      day = Day.where(value: new_day).first_or_create
      slot = day.slots.where( vacation_type_id: self.vacation_type.id,
                              vacation_period_id: self.id,
                              slotable: self.vacation_periodable).first_or_create
    end    
  end
 
  def slug_candidates
    [
      [vacation_type, start_date.year, vacation_periodable],
      [vacation_type, start_date.year, start_date.month, start_date.day, vacation_periodable],
    ]
  end

end