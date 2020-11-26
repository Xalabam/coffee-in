json.claims do
  json.array! @claims do |claim|
    json.extract! claim.coupon, :id, :name, :validity, :offer, :address, :shop_name, :shop_info, :contacts
  end
end
