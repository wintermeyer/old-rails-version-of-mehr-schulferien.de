class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :value
      t.references :month, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :days, :value, unique: true
  end
end
