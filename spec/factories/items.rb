FactoryBot.define do
  factory :item do
    user
    name { 'nametest1' }
    description { 'descriptiontest1' }
    category_id { '2' }
    status_id { '2' }
    delivery_area_id { '2' }
    delivery_price_id { '2' }
    shipping_day_id { '2' }
    price {'1000'}
  end
end