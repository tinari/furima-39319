FactoryBot.define do
  factory :pay do
    user_id {Faker::Number.non_zero_digit}
    item_id {Faker::Number.non_zero_digit}
    address {"#{Faker::Number.between(from: 100, to: 999)}-#{Faker::Number.between(from: 1000, to: 9999)}"}
    region_id { 3 } 
    municipality {Faker::Address.city}                   
    house_number {Faker::Address.street_address}
    building_name {Faker::Address.secondary_address}                  
    tel {Faker::Number.between(from: 1234567890, to: 12345678901)}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
