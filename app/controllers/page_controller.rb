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

    if !current_user
      expires_in 12.hours, :public => false
    end
    fresh_when etag: [current_user, @year, @month, @last_federal_state, @last_school]
  end

  def login
  end

  def status
    if current_user
      @schools = School.where(id: PaperTrail::Version.where(whodunnit: current_user.id, item_type: 'School').pluck(:item_id).uniq).
                        order(:slug)
    else
      redirect_to page_login_path, notice: 'Zum Aufrufen der Status-Seite müssen Sie sich erst einloggen.'
    end
  end

  def inverse
    vacation_days = Day.where(id: Slot.where(vacation_type_id: VacationType.where(public_holiday: false).where.not(name: 'Beweglicher Ferientag')).pluck(:day_id)).where(value: Date.today.beginning_of_month .. (Date.today + 18.months).end_of_month)
    @inverse_days = Day.where(value: Date.today.beginning_of_month .. (Date.today + 18.months).end_of_month).
                        where.not(id: vacation_days).
                        order(:value)
    @months = Month.where(id: Day.where(value: Date.today.beginning_of_month .. (Date.today + 18.months).end_of_month).pluck(:month_id)).uniq

    expires_in 12.hours, :public => false
    fresh_when etag: [current_user, @inverse_days]
  end

  def about_us
  end

  def developer
  end

  def api
  end
end
