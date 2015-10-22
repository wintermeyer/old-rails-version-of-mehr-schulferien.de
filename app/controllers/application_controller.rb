class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_variables, only: [:show, :index]

  def set_variables
    @years = Year.where(value: (Date.today.year)..Year.maximum(:value)).order(:value).limit(10)
  end
end
