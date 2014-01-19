class Month < ActiveRecord::Base
  extend FriendlyId
  friendly_id :value, use: :slugged

  has_many :days
  belongs_to :year, touch: true

  validates :year_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :year,
            presence: true

  validates :value,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1, 
                            less_or_equal_than: 12 },
            uniqueness: { scope: :year }

  after_create :create_days

  def to_s
    value.to_s
  end

  private
  def create_days
    last_day_of_month = Date.parse("1.#{self.value}.#{self.year.value}").end_of_month
    if self.days.count != last_day_of_month.day.to_i
      (1..(last_day_of_month.day.to_i)).each do |i|
        self.days.where(value: Date.parse("#{i}.#{self.value}.#{self.year.value}")).first_or_create
      end
    end
  end
end
