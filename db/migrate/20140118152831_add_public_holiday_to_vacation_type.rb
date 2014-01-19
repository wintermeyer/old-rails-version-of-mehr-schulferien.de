class AddPublicHolidayToVacationType < ActiveRecord::Migration
  def change
    add_column :vacation_types, :public_holiday, :boolean
  end
end
