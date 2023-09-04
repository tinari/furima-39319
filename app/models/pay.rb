class Pay
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :address, :region_id, :municipality, :house_number, :building_name, :tel, :buy_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}                    
    validates :municipality                    
    validates :house_number                   
    validates :tel, format: {with: /\A\d{10,11}\z/,message: "is invalid"}
    validates :token
  end

    def save
      buy= Buy.create(item_id: item_id, user_id: user_id)
      Order.create(address: address,region_id: region_id,municipality: municipality,house_number: house_number,building_name: building_name, tel: tel, buy_id: buy.id)
    end
end
