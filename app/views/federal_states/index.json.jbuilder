json.array!(@federal_states) do |federal_state|
  json.extract! federal_state, :id, :country_id, :name, :slug
  json.url federal_state_url(federal_state, format: :json)
end
