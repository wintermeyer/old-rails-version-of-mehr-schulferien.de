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

  def bewegliche_ferientag_vacation_periods(month = nil)
    if month.nil? || month.class != Month
      nil
    else
      schools = self.schools
      vacation_type = VacationType.where(name: 'Beweglicher Ferientag', 
                                         public_holiday: false).first_or_create

      VacationPeriod.where(vacation_periodable_type: 'School', 
                           vacation_periodable_id: schools.pluck(:id), 
                           vacation_type_id: vacation_type.id).
                     where(start_date: (month.days.order(:value).first.value .. month.days.order(:value).last.value))
    end
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
