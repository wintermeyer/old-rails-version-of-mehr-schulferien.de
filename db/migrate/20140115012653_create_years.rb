class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :value
      t.string :slug

      t.timestamps
    end
    add_index :years, :slug
  end
end
