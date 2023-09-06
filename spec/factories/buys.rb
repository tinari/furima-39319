FactoryBot.define do
  factory :buy do
    
    association :item
    user{ item.user }
    association :order


    
    user_id { 9 }
    item_id { 15 }
  end
end
