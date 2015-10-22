json.array!(@months) do |month|
  json.extract! month, :id, :value, :year_id
  json.url month_url(month, format: :json)
end
