class FederalState < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :country, touch: true
  has_many :slots, as: :slotable, dependent: :destroy
  has_many :days, through: :slots
  has_many :vacation_periods, as: :vacation_periodable, dependent: :destroy

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
end
