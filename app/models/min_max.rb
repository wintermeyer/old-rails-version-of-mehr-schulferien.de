class MinMax < ActiveRecord::Base
  extend FriendlyId
  friendly_id :number_of_vacation_days_for_slug

  validates :number_of_vacation_days,
            presence: true,
            uniqueness: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  default_scope order(:number_of_vacation_days)

  def to_s
    self.number_of_vacation_days.to_s
  end

  private
  def number_of_vacation_days_for_slug
    self.number_of_vacation_days.to_s
  end

end
