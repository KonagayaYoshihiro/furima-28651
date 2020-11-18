FactoryBot.define do
  factory :name do
    nickname { 'abe' }
    name { 'nametest1' }
    description { 'descriptiontest1' }
    category_id { '2' }
    first_name { '太郎' }
    last_name_kana { 'シケン' }
    first_name_kana { 'タロウ' }
    birthday { '2020-01-01' }
  end
end