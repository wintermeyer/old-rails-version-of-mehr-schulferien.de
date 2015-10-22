class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :value

      t.timestamps null: false
    end
    add_index :years, :value, unique: true
  end
end
