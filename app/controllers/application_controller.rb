class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_variables, only: [:show, :index]

  def set_variables
    @years = Year.where(value: (Date.today.year)..Year.maximum(:value)).order(:value).limit(10)

    if params[:federal_state_id]
      @federal_state = FederalState.friendly.find(params[:federal_state_id])
    end

    if params[:year_id]
      @year = Year.friendly.find(params[:year_id])
    end
  end
end
