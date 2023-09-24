class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :buy

  has_many_attached :images
  belongs_to_active_hash :genre, foreign_key: :category_id
  belongs_to_active_hash :situation, foreign_key: :situation_id
  belongs_to_active_hash :delivery, foreign_key: :delivery_charge_id
  belongs_to_active_hash :region, foreign_key: :region_id
  belongs_to_active_hash :shipment, foreign_key: :shipment_id

  validates :item,                null: false, presence: true
  validates :images,              null: false, presence: true, length: {minimum: 1,maximum: 3, message: "は1枚以上3枚以下にしてください"}
  validates :price,               null: false, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :content,             null: false, presence: true                    
  validates :category_id,         null: false, numericality: { other_than: 1,message: "を入力してください"}                    
  validates :situation_id,        null: false, numericality: { other_than: 1,message: "を入力してください"}                   
  validates :delivery_charge_id,  null: false, numericality: { other_than: 1,message: "を入力してください"}                 
  validates :region_id,           numericality: { other_than: 1,message: "を入力してください"}                 
  validates :shipment_id,         null: false, numericality: { other_than: 1,message: "を入力してください"}
end


