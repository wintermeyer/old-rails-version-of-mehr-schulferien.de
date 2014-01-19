class Slot < ActiveRecord::Base
  belongs_to :day, touch: true
  belongs_to :slotable, polymorphic: true, touch: true
  belongs_to :vacation_type, touch: true
  belongs_to :vacation_period, touch: true

  validates :vacation_type_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :vacation_type,
            presence: true

  validates :day_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 },
            uniqueness: { scope: [:slotable, :vacation_type] }

  validates :day,
            presence: true

  validates :slotable_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :slotable,
            presence: true

  validates :vacation_period_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :vacation_period,
            presence: true

end
