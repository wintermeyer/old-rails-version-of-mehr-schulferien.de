json.array!(@schools) do |school|
  json.extract! school, :id, :name, :slug, :city_id, :address_line1, :address_line2, :street, :zip_code, :address_city_name, :phone_number, :fax_number, :email, :homepage
  json.url school_url(school, format: :json)
end
