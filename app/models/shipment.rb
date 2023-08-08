class Shipment < ActiveHash::Base
  self.data = [
    { id: 1,shipment_id: '---'},
    { id: 2,shipment_id: '1~2日で発送'},
    { id: 3,shipment_id: '2~3日で発送'},
    { id: 4,shipment_id: '4~7日で発送'}
  ]

  include ActiveHash::Associations
  has_many :articles
  
  end