class SpecialCalendarsController < ApplicationController
  def inverse
    vacation_days = Day.where(id: Slot.where(vacation_type_id: VacationType.where(public_holiday: false).where.not(name: 'Beweglicher Ferientag')).pluck(:day_id)).where(value: Date.today.beginning_of_month .. (Date.today + 18.months).end_of_month)
    @inverse_days = Day.where(value: Date.today.beginning_of_month .. (Date.today + 17.months).end_of_month).
                        where.not(id: vacation_days).
                        order(:value)
    @months = Month.where(id: Day.where(value: Date.today.beginning_of_month .. (Date.today + 17.months).end_of_month).pluck(:month_id)).uniq

    @public_holiday_days = Day.where(id: Slot.where(vacation_type_id: VacationType.where(public_holiday: true)).pluck(:day_id))


    expires_in 12.hours, :public => false
    fresh_when etag: [current_user, @inverse_days]
  end

  def bridging_days
  end
end
