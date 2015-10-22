class AddWdayToDays < ActiveRecord::Migration
  def change
    add_column :days, :wday, :integer
    add_column :days, :position, :integer
  end
end
