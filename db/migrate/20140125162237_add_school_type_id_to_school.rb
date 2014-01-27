class AddSchoolTypeIdToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :school_type_id, :integer
    add_index :schools, :school_type_id
  end
end
