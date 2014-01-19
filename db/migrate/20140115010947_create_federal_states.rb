class CreateFederalStates < ActiveRecord::Migration
  def change
    create_table :federal_states do |t|
      t.integer :country_id
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :federal_states, :country_id
    add_index :federal_states, :slug
  end
end
