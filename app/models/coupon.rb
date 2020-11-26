class Coupon < ApplicationRecord
  belongs_to :user

  has_many :claims, dependent: :destroy
  has_many :users, through: :claims
end
