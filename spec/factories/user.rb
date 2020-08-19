FactoryBot.define do
  factory :user do
    nickname              { "tarou" }
    email                 { "aaa@gmail.com" }
    password              { "12345a" }
    password_confirmation { password }
    family_name           { "山田" }
    first_name            { "太郎" }
    family_name_kana      { "ヤマダ" }
    first_name_kana       { "タロウ" }
    birth_day             { "20001224" }
  end
end