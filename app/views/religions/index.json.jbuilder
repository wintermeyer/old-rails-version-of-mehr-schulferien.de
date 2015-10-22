json.array!(@religions) do |religion|
  json.extract! religion, :id, :name, :slug
  json.url religion_url(religion, format: :json)
end
