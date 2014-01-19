class CreateVacationPeriods < ActiveRecord::Migration
  def change
    create_table :vacation_periods do |t|
      t.date :start_date
      t.date :end_date
      t.string :vacation_periodable_type
      t.integer :vacation_periodable_id
      t.integer :vacation_type_id
      t.string :description
      t.string :state

      t.timestamps
    end
    add_index :vacation_periods, :vacation_periodable_type
    add_index :vacation_periods, :vacation_periodable_id
  end
end
