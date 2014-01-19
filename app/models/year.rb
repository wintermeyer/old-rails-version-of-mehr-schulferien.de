class Year < ActiveRecord::Base
  extend FriendlyId
  friendly_id :value, use: :slugged

  has_many :months

  validates :value,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than => 2012, :less_than => 2099 },
            :uniqueness => true

  after_create :create_months

  def to_s
    value.to_s
  end

  private
  def create_months
    if self.months.count != 12
      (1..12).each do |i|
        self.months.where(value: i).first_or_create
      end
    end
  end
end
