class PageController < ApplicationController
  def index
    date = Day.where(value: Date.today).first
    @month = date.month
    @year = @month.year
    @federal_states = FederalState.all.order(:name)
    @months = [
               @month, 
               Day.where(value: Date.today + 1.month).first.month, 
               Day.where(value: Date.today + 2.month).first.month, 
              ]

    if cookies[:last_federal_state] && FederalState.where(slug: cookies[:last_federal_state]).any?
      @federal_state = FederalState.where(slug: cookies[:last_federal_state]).first
      expires_in 60.minutes, :public => false
      fresh_when etag: [@year, @month, @federal_state]
    else
      @federal_state = FederalState.all.sample
    end
  end

  def about_us
  end

  def developer
  end

  def api
  end
end
