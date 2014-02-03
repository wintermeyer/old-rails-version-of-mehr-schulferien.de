class Authentication < ActiveRecord::Base
  belongs_to :user, touch: true

  validates :user_id,
            presence: true,
            numericality: { only_integer: true, 
                            greater_or_equal_than: 1 }

  validates :user,
            presence: true

  validates :provider,
            presence: true

  validates :uid,
            presence: true
end
