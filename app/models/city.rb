class City < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :federal_state, touch: true
  # has_many :schools, -> { order('schools.name') }, dependent: :destroy
  has_many :schools, dependent: :destroy

  delegate :country, :to => :federal_state, :allow_nil => true

  # Validations
  #
  validates :name,
            presence: true

  validates :federal_state,
            presence: true

  validates :zip_code,
            presence: true

  def to_s
    name
  end

  def komma_seperated_address
    "#{self.zip_code} #{self.name},#{self.country}".gsub(/,,/,',')
  end

  private
  def slug_candidates
    [
      [:zip_code, :name]
    ]
  end
end
