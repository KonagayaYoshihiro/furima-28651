FactoryBot.define do
  factory :order do
   user_id { 1 }
   item_id { 1 }
   postal_code { '222-2222' }
   delivery_area_id { 2 }
   city { '横浜市' }
   house_number { '2' }
   building_name { '345' }
   telephone_number { '00011112222' }
   token {"tok_abcdefghijk00000000000000000"}
  end
end
