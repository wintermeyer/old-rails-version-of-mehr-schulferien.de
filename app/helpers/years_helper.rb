module YearsHelper
  def cache_key_for_years
    count          = Year.count
    max_updated_at = Year.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "years/all-#{count}-#{max_updated_at}"
  end
end
