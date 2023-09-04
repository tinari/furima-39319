FactoryBot.define do
  factory :buy do
    
    association :item
    user{ item.user }
    association :order


    item_id { 15 }
    user_id { 9 }

  end
end
