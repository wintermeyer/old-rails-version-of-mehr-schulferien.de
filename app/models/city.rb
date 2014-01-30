class City < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :federal_state, touch: true
  has_many :schools, dependent: :destroy

  delegate :country, :to => :federal_state, :allow_nil => true

  validates :name,
            :presence => true

  validates :zip_code,
            :presence => true,
            :uniqueness => true

  validates :federal_state_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :federal_state,
            presence: true            

  def to_s
    name
  end

  private
  def slug_candidates
    [
      :name,
      [:name, :zip_code]
    ]
  end  
end
