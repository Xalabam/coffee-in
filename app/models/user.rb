class User < ApplicationRecord
  has_many :coupons
  has_many :claims
end
