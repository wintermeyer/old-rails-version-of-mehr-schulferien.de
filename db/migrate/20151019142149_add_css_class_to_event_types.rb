class AddCssClassToEventTypes < ActiveRecord::Migration
  def change
    add_column :event_types, :css_class, :string
  end
end
