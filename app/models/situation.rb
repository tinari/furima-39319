class Situation < ActiveHash::Base
  self.data = [
    { id: 1,situation_id: '---'},
    { id: 2,situation_id: '新品・未使用'},
    { id: 3,situation_id: '未使用に近い'},
    { id: 4,situation_id: '目立った傷や汚れなし'},
    { id: 5,situation_id: 'やや傷や汚れあり'},
    { id: 6,situation_id: '傷や汚れあり'},
    { id: 7,situation_id: '全体的に状態が悪い'},

  ]

include ActiveHash::Associations
has_many :articles

end