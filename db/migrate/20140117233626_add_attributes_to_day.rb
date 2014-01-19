class AddAttributesToDay < ActiveRecord::Migration
  def change
    add_column :days, :day_of_month, :integer
    add_column :days, :wday, :integer
  end
end
