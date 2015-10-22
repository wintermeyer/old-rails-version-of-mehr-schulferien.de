class EventType < ActiveRecord::Base
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
