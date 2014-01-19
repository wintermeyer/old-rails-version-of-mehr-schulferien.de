class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.integer :value
      t.string :slug
      t.integer :year_id

      t.timestamps
    end
    add_index :months, :slug
    add_index :months, :year_id
  end
end
