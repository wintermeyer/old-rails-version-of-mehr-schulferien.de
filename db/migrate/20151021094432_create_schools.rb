class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :slug
      t.references :city, index: true, foreign_key: true
      t.string :address_line1
      t.string :address_line2
      t.string :street
      t.string :zip_code
      t.string :address_city_name
      t.string :phone_number
      t.string :fax_number
      t.string :email
      t.string :homepage

      t.timestamps null: false
    end
  end
end
