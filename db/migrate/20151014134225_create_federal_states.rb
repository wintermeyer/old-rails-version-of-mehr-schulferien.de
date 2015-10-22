class CreateFederalStates < ActiveRecord::Migration
  def change
    create_table :federal_states do |t|
      t.references :country, index: true, foreign_key: true
      t.string :name
      t.string :slug
      t.string :url

      t.timestamps null: false
    end
    add_index :federal_states, :slug, unique: true
  end
end
