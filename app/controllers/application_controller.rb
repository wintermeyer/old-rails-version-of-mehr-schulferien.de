class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :available_years

  def available_years
    Year.where(value: Date.today.year.to_i .. (Date.today + 10.years).year.to_i).order(:value)
  end
end
