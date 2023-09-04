class Order < ApplicationRecord
  belongs_to :buy
  
       
  with_options presence: true do
  validates :address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :region_id, presence: true, numericality: { other_than: 1,message: "can't be blank"}                
  validates :municipality, presence: true                  
  validates :house_number, presence: true                 
  validates :tel, presence: true, format: {with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
  end
end
