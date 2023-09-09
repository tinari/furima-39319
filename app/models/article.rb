class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :situation
  belongs_to :delivery
  belongs_to :region
  belongs_to :shipment

  validates :item, :user, :images, :price, :content, presence: true
  validates :category_id, :situation_id, :delivery_charge_id, :region_id, :shipment_id, null: false, numericality: { other_than: 1 , message: "can't be blank"}
end
