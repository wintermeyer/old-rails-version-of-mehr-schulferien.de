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

  def long_weekend_days(federal_state = nil)
    sunday = self.days.order(:value).first.value.end_of_week
    results = []
    while sunday.month == self.value do
     weekend = []
     (-2..1).each do |i|
       if Day.where(value: (sunday + i.days)).first.is_weekend? || 
          Day.where(value: (sunday + i.days)).first.is_public_holiday?(federal_state)
         weekend.push(Day.where(value: sunday + i.days).first.id)
       end
     end

     results << weekend if weekend.count > 2

     sunday += 1.week
    end 
    
    if results.blank?
      nil
    else
      Day.where(id: results).order(:value)
    end
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
