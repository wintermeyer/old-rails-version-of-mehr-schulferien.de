json.array!(@countries) do |country|
  json.extract! country, :id, :name, :slug
  json.url country_url(country, format: :json)
end
