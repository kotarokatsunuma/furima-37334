FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' +Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.birthday}
    family_name           {"ふりま"}
    first_name            {"たろう"}
    family_name_kana      {"フリマ"}
    first_name_kana       {"タロウ"}
  end
end