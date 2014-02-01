class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :read_cookies

  helper_method :available_years

  def available_years
    Year.where(value: Date.today.year.to_i .. (Date.today + 10.years).year.to_i).order(:value)
  end

  private
  def read_cookies
    if cookies[:last_federal_state] && FederalState.where(slug: cookies[:last_federal_state]).any?
      @last_federal_state = FederalState.where(slug: cookies[:last_federal_state]).first
    end

    if cookies[:last_school] && School.where(slug: cookies[:last_school]).any?
      @last_school = School.where(slug: cookies[:last_school]).first
    end
  end
end
