class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :day_id
      t.string :slotable_type
      t.integer :slotable_id
      t.integer :vacation_type_id
      t.string :description
      t.integer :vacation_period_id

      t.timestamps
    end
    add_index :slots, :day_id
    add_index :slots, :slotable_type
    add_index :slots, :slotable_id
    add_index :slots, :vacation_type_id
    add_index :slots, :vacation_period_id
  end
end
