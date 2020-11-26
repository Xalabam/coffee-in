json.coupons do
  json.array! @coupons do |coupon|
    json.extract! coupon, :id, :name, :validity, :offer, :address, :shop_name, :shop_info, :contacts
  end
end
