json.array!(@events) do |event|
  json.extract! event, :id, :starts_on, :ends_on, :summary, :eventable_id, :eventable_type, :event_type_id, :religion_id
  json.url event_url(event, format: :json)
end
