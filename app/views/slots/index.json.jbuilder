json.array!(@slots) do |slot|
  json.extract! slot, :id, :event_id, :day_id
  json.url slot_url(slot, format: :json)
end
