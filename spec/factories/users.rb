FactoryBot.define do
  factory :user do
    nickname { Faker::Name }
    email                 { Faker::Internet.email }
    password              { 'abc123' }
    password_confirmation { 'abc123' }
    last_name             { '山田' }
    first_name            { '陸太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birthday              { Faker::Date.birthday(min_age: 0, max_age: 100) }
  end
end
