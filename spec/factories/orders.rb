FactoryBot.define do
  factory :order do
    address {"#{Faker::Number.between(from: 100, to: 999)}-#{Faker::Number.between(from: 1000, to: 9999)}"}
    region_id { 3 } 
    municipality {Faker::Address.city}                   
    house_number {Faker::Address.street_address}
    building_name {Faker::Address.secondary_address}                  
    tel {Faker::Number.between(from: 1234567890, to: 12345678901)}
  end
  end
