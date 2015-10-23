class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
    add_index :filters, :slug, unique: true
  end
end
