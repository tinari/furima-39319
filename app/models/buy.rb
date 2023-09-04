class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :order
  attr_accessor :token

  with_options presence: true do
  validates :item_id
  validates :user_id

  #validates :address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #validates :region_id, numericality: { other_than: 1,message: "can't be blank"}          
  #validates :municipality                 
  #validates :house_number                
  #validates :tel, format: {with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
  end
end
