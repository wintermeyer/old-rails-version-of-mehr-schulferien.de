json.array!(@vacation_types) do |vacation_type|
  json.extract! vacation_type, :id, :name, :slug
  json.url vacation_type_url(vacation_type, format: :json)
end
