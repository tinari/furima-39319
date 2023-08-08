class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
 # has_one    :buy
  has_one_attached :image
  belongs_to_active_hash :genre, foreign_key: :category_id
  belongs_to_active_hash :situation, foreign_key: :situation_id
  belongs_to_active_hash :delivery, foreign_key: :delivery_charge_id
  belongs_to_active_hash :region, foreign_key: :region_id
  belongs_to_active_hash :shipment, foreign_key: :shipment_id



  validates :item,                null: false, presence: true
  validates :image,               null: false, presence: true
  validates :price,               null: false, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :content,             null: false, presence: true                    
  validates :category_id,         null: false, numericality: { other_than: 1,message: "can't be blank"}                    
  validates :situation_id,        null: false, numericality: { other_than: 1,message: "can't be blank"}                   
  validates :delivery_charge_id,  null: false, numericality: { other_than: 1,message: "can't be blank"}                 
  validates :region_id,           null: false, numericality: { other_than: 1,message: "can't be blank"}                 
  validates :shipment_id,         null: false, numericality: { other_than: 1,message: "can't be blank"}

  def sold_out?
    sold_out?
    self.sold_out_status == true
  end



end


