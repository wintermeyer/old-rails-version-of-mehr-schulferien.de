class Religion < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :events

  # Validations
  #
  validates :name,
            presence: true,
            uniqueness: true

  def to_s
    name
  end
end
