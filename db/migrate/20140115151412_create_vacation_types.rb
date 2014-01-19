class CreateVacationTypes < ActiveRecord::Migration
  def change
    create_table :vacation_types do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :vacation_types, :slug
  end
end
