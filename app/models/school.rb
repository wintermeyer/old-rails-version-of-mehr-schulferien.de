class School < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :city, touch: true

  # Callbacks
  #
  before_validation :downcase_email

  # Validations
  #
  validates :city,
            presence: true

  validates :name,
            presence: true

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
