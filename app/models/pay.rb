class Pay
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :region_id, :municipality, :house_number, :building_name, :tel, :buy_id, :token

  with_options presence: true do
    validates :user_id, presence: { message: "ログインしてください" }
    validates :item_id, presence: { message: "を確認してください" }
    validates :address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンを含めた半角文字列で入力してください (例:123-4567)"}
    validates :region_id, numericality: {other_than: 1, message: "を入力してください"}                    
    validates :municipality                    
    validates :house_number                   
    validates :tel, format: {with: /\A\d{10,11}\z/,message: "は10桁以上11桁以内の半角数値で入力してください"}
    validates :token
  end

    def save
      buy= Buy.create( user_id: user_id, item_id: item_id)
      Order.create(address: address,region_id: region_id,municipality: municipality,house_number: house_number,building_name: building_name, tel: tel, buy_id: buy.id)
    end
end
