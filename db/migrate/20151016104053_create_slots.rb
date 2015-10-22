class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.references :event, index: true, foreign_key: true
      t.references :day, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
