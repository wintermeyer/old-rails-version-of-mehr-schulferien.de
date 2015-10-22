json.array!(@cities) do |city|
  json.extract! city, :id, :name, :slug, :zip_code, :federal_state_id
  json.url city_url(city, format: :json)
end
