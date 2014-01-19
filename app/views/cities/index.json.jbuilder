json.array!(@cities) do |city|
  json.extract! city, :id, :federal_state_id, :name, :slug, :zip_code
  json.url city_url(city, format: :json)
end
