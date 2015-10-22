module FederalStatesHelper
  def cache_key_for_federal_states
    count          = FederalState.count
    max_updated_at = FederalState.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "federal_states/all-#{count}-#{max_updated_at}"
  end
end
