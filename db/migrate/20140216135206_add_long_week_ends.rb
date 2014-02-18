class AddLongWeekEnds < ActiveRecord::Migration
  def up
    Year.all.each do |year|
      year.months.each do |month|
        month.create_long_weekend_vacation_periods
      end
    end
  end

  def down
    vacation_type = VacationType.where(name: 'Langes Wochenende').first_or_create
    vacation_type.vacation_periods.destroy_all
  end
end
