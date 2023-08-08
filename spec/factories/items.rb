FactoryBot.define do
  factory :item do
        item                { "なんかすごい本" }
        content             { "重複して買ってしまった本です" }
        category_id         { 3 }
        situation_id        { 3 }
        delivery_charge_id  { 3 }
        region_id           { 3 }
        shipment_id         { 3 }
        price               { 100000 }

        association :user

        after(:build)do |item|
        item.image.attach(io: File.open('public/image.s/sample.png'), filename: 'sample.png')
      end
    end
  end

