class Filter < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Validations
  #
  validates :name,
            presence: true,
            uniqueness: true

  def to_s
    name
  end
end
