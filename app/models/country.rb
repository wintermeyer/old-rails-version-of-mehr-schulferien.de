class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :federal_states, dependent: :destroy
  has_many :slots, as: :slotable, dependent: :destroy
  has_many :days, through: :slots
  has_many :vacation_periods, as: :vacation_periodable, dependent: :destroy

  validates :name,
            presence: true,
            uniqueness: true

  def to_s
    name
  end

end
