class Slot < ActiveRecord::Base
  belongs_to :event, touch: true
  belongs_to :day, touch: true

  # Validations
  #
  validates :event,
            presence: true

  validates :day,
            presence: true,
            uniqueness: { scope: [:event] }
end
