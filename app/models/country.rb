class Country < ActiveRecord::Base
#  has_many :federal_states, -> {order('federal_states.name')}
  has_many :federal_states

  # Validations
  #
  validates :name,
            presence: true,
            uniqueness: true

  def to_s
    name
  end
end
