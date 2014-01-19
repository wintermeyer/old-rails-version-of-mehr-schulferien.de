class VacationType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :vacation_periods, dependent: :destroy
  has_many :slots, dependent: :destroy

  validates :name,
            :presence => true,
            :uniqueness => true

  def to_s
    name
  end
end
