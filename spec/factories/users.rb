FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password}
    name                  { "全角" }
    family_name           { "全角" }
    kana_name             { "カタカナ"}
    kana_family_name      { "カタカナ" }
    birthday              { Faker::Date.birthday }
  end
end