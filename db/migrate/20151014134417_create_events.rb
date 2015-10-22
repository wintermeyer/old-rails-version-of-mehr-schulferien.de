class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :starts_on
      t.date :ends_on
      t.string :summary
      t.references :eventable, polymorphic: true, index: true
      t.references :event_type, index: true, foreign_key: true
      t.references :religion, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :events, :starts_on
    add_index :events, :ends_on
  end
end
