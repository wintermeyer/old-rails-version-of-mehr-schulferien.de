class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :countries, :slug
  end
end
