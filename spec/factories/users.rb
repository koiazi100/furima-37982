FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 {Faker::Internet.free_email}
    password              { 'abcd1234' }
    password_confirmation { password }
    birthday              { '1994-10-18' }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
  end
end
