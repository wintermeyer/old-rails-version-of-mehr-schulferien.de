class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.integer :value
      t.references :year, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :months, :value
  end
end
