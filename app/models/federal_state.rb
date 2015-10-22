class FederalState < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :country, touch: true

  has_many :events, -> {order('events.starts_on')}, as: :eventable, dependent: :destroy
  has_many :days, through: :events
  has_many :cities, -> { order('cities.name') }, dependent: :destroy

  # Validations
  #
  validates :name,
            presence: true,
            uniqueness: { scope: :country }

  def to_s
    name
  end
end
