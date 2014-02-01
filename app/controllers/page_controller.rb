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


    expires_in 12.hours, :public => false
    fresh_when etag: [@year, @month, @last_federal_state, @last_school]
  end

  def about_us
  end

  def developer
  end

  def api
  end
end
