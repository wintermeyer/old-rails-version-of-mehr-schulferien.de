class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :federal_state_id
      t.string :name
      t.string :slug
      t.string :zip_code

      t.timestamps
    end
    add_index :cities, :federal_state_id
    add_index :cities, :slug
  end
end
