json.array!(@schools) do |school|
  json.extract! school, :id, :city_id, :name, :slug, :address_line1, :address_line2, :street, :zip_code, :city
  json.url school_url(school, format: :json)
end
