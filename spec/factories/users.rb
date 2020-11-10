FactoryBot.define do
  factory :user do
    nickname { 'abe' }
    email { 'aaa@gmail.com' }
    password { 'aaa1aaa' }
    password_confirmation { password }
    last_name { '試験' }
    first_name { '太郎' }
    last_name_kana { 'シケン' }
    first_name_kana { 'タロウ' }
    birthday { '2020-01-01' }
  end
end
