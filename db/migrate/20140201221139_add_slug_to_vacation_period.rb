class AddSlugToVacationPeriod < ActiveRecord::Migration
  def change
    add_column :vacation_periods, :slug, :string
    add_index :vacation_periods, :slug
  end
end
