class SchoolType < ActiveRecord::Base
  has_many :schools, dependent: :destroy

  validates :name,
            presence: true

  def to_s
    name
  end
end
