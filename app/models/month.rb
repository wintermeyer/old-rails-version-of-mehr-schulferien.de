class Month < ActiveRecord::Base
  belongs_to :year, touch: true

  has_many :days, -> { order('days.value') }, dependent: :destroy
#  has_many :events, -> { uniq }, through: :days
  has_many :events, through: :days

  # Validations
  #
  validates :value,
            presence: true,
            uniqueness: { scope: :year },
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }

  validates :year,
            presence: true

  def to_s
    "#{value}/#{year}"
  end
end
