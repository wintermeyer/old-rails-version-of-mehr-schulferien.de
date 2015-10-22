json.array!(@days) do |day|
  json.extract! day, :id, :value, :month_id
  json.url day_url(day, format: :json)
end
