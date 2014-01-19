class School < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :city, touch: true
  has_many :slots, as: :slotable, dependent: :destroy
  has_many :days, through: :slots
  has_many :vacation_periods, as: :vacation_periodable, dependent: :destroy

  validates :city_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :city,
            presence: true

  validates :name,
            presence: true

  def to_s
    name
  end  
end
