class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :value
      t.string :slug
      t.integer :month_id

      t.timestamps
    end
    add_index :days, :slug
    add_index :days, :month_id
  end
end
