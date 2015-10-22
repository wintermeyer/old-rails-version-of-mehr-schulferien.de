class CreateReligions < ActiveRecord::Migration
  def change
    create_table :religions do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
    add_index :religions, :slug, unique: true
  end
end
