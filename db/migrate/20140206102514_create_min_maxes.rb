class CreateMinMaxes < ActiveRecord::Migration
  def up
    create_table :min_maxes do |t|
      t.integer :number_of_vacation_days
      t.string :slug

      t.timestamps
    end

    (1..90).each do |i|
      MinMax.create(number_of_vacation_days: i)
    end
  end

  def down
    drop_table :min_maxes
  end 
end
