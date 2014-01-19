json.array!(@vacation_periods) do |vacation_period|
  json.extract! vacation_period, :id, :start_date, :end_date, :vacation_periodable_type, :vacation_periodable_id, :vacation_type_id, :description, :state
  json.url vacation_period_url(vacation_period, format: :json)
end
