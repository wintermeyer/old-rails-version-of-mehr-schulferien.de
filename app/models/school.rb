class School < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :city, touch: true
  belongs_to :school_type, touch: true
  has_many :slots, as: :slotable, dependent: :destroy
  has_many :days, through: :slots
  has_many :vacation_periods, as: :vacation_periodable, dependent: :destroy

  validates :city_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :city,
            presence: true

  validates :name,
            presence: true

  before_validation :downcase_email

  def to_s
    name
  end

  def komma_seperated_address
    "#{self.street},#{self.zip_code} #{self.address_city_name},#{self.city.country}".gsub(/,,/,',')
  end

  private
  def slug_candidates
    [
      [:zip_code, :name],
      [:zip_code, :name, :address_city_name]
    ]
  end

  def downcase_email
    if self.email.blank?
      self.email = nil
    else
      self.email = self.email.downcase
    end
  end
end
