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
#  after_update :create_long_weekend_vacation_periods
#  after_touch :create_long_weekend_vacation_periods

  def to_s
    value.to_s
  end

  def create_long_weekend_vacation_periods
    FederalState.all.each do |federal_state|
      # Loop through all Sundays
      #
      sunday = self.days.order(:value).first.value.end_of_week
      results = []
      while sunday.month == self.value do
        weekend = []
        (-2..1).each do |i|
          if Day.where(value: (sunday + i.days)).first.is_weekend? || 
            Day.where(value: (sunday + i.days)).first.is_public_holiday?(federal_state)
            if (i == -2) && (Day.where(value: (sunday + (-3).days)).first.is_weekend? || 
                            Day.where(value: (sunday + (-3).days)).first.is_public_holiday?(federal_state))
              weekend.push(Day.where(value: sunday + (-3).days).first.id)
            end
            weekend.push(Day.where(value: sunday + i.days).first.id)
            if (i == 1) && (Day.where(value: (sunday + 2.days)).first.is_weekend? || 
                           Day.where(value: (sunday + 2.days)).first.is_public_holiday?(federal_state))
              weekend.push(Day.where(value: sunday + 2.days).first.id)
            end
          end
        end

        # Create long weekend vacation_period
        #
        long_weekend_days = Day.where(id: weekend).order(:value)

        if long_weekend_days.count > 2
          vacation_type = VacationType.where(name: 'Langes Wochenende').first_or_create
          vacation_period = federal_state.vacation_periods.
                                          where(vacation_type_id: vacation_type.id).
                                          where(start_date: long_weekend_days.first.value).
                                          where(end_date: long_weekend_days.last.value).
                                          first_or_create
        end

        # Following Sunday
        #
        sunday += 1.week
      end 
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
