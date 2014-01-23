class City < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :federal_state, touch: true

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


  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name,
      [:name, :zip_code]
    ]
  end  
end
