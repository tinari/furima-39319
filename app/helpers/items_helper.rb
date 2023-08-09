module ItemsHelper

  def category_text(category_id)
    options = [
      { id: 1, category_id: '---' },
      { id: 2, category_id: 'メンズ' },
      { id: 3, category_id: 'レディース' },
      { id: 4, category_id: 'ベビー・キッズ' },
      { id: 5, category_id: 'インテリア・住まい・小物' },
      { id: 6, category_id: '本・音楽・ゲーム' },
      { id: 7, category_id: 'おもちゃ・ホビー・グッズ' },
      { id: 8, category_id: '家電・スマホ・カメラ' },
      { id: 9, category_id: 'スポーツ・レジャー' },
      { id: 10,category_id: 'ハンドメイド' },
      { id: 11,category_id: 'その他'},
    ]

    option = options.find { |opt| opt[:id] == category_id }
    option ? option[:category_id] : '未設定'
  end

def situation_text(situation_id)
 options = [
  { id: 1,situation_id: '---'},
  { id: 2,situation_id: '新品・未使用'},
  { id: 3,situation_id: '未使用に近い'},
  { id: 4,situation_id: '目立った傷や汚れなし'},
  { id: 5,situation_id: 'やや傷や汚れあり'},
  { id: 6,situation_id: '傷や汚れあり'},
  { id: 7,situation_id: '全体的に状態が悪い'},
]

   option = options.find { |opt| opt[:id] == situation_id }
   option ? option[:situation_id] : '未設定'
end

  def delivery_charge_text(delivery_charge_id)
    options = [
      { id: 1, delivery_charge_id: '---' },
      { id: 2, delivery_charge_id: '着払い(購入者負担)' },
      { id: 3, delivery_charge_id: '送料込み(出品者負担)' }
    ]

    option = options.find { |opt| opt[:id] == delivery_charge_id }
    option ? option[:delivery_charge_id] : '未設定'
  end

  def region_text(region_id)
    options = [
      { id: 1,region_id: '---'},
      { id: 2,region_id: '北海道'},
      { id: 3,region_id: '青森県',},
      { id: 4,region_id: '岩手県'},
      { id: 5,region_id: '宮城県'},
      { id: 6,region_id: '秋田県'},
      { id: 7,region_id: '山形県'},
      { id: 8,region_id: '福島県'},
      { id: 9,region_id: '茨城県'},
      { id: 10,region_id: '栃木県'},
      { id: 11,region_id: '群馬県'},
      { id: 12,region_id: '埼玉県'},
      { id: 13,region_id: '千葉県'},
      { id: 14,region_id: '東京都'},
      { id: 15,region_id: '神奈川県'},
      { id: 16,region_id: '新潟県'},
      { id: 17,region_id: '富山県'},
      { id: 18,region_id: '石川県'},
      { id: 19,region_id: '福井県'},
      { id: 20,region_id: '山梨県'},
      { id: 21,region_id: '長野県'},
      { id: 22,region_id: '岐阜県'},
      { id: 23,region_id: '静岡県'},
      { id: 24,region_id: '愛知県'},
      { id: 25,region_id: '三重県'},
      { id: 26,region_id: '滋賀県'},
      { id: 27,region_id: '京都府'},
      { id: 28,region_id: '大阪府'},
      { id: 29,region_id: '兵庫県'},
      { id: 30,region_id: '奈良県'},
      { id: 31,region_id: '和歌山県'},
      { id: 32,region_id: '鳥取県'},
      { id: 33,region_id: '島根県'},
      { id: 34,region_id: '岡山県'},
      { id: 35,region_id: '広島県'},
      { id: 36,region_id: '山口県'},
      { id: 37,region_id: '徳島県'},
      { id: 38,region_id: '香川県'},
      { id: 39,region_id: '愛媛県'},
      { id: 40,region_id: '高知県'},
      { id: 41,region_id: '福岡県'},
      { id: 42,region_id: '佐賀県'},
      { id: 43,region_id: '長崎県'},
      { id: 44,region_id: '熊本県'},
      { id: 45,region_id: '大分県'},
      { id: 46,region_id: '宮崎県'},
      { id: 47,region_id: '鹿児島県'},
      { id: 48,region_id: '沖縄県'},
    ]
    option = options.find { |opt| opt[:id] == region_id }
    option ? option[:region_id] : '未設定'
  end

  def shipment_text(shipment_id)
    options = [
      { id: 1,shipment_id: '---'},
      { id: 2,shipment_id: '1~2日で発送'},
      { id: 3,shipment_id: '2~3日で発送'},
      { id: 4,shipment_id: '4~7日で発送'}
    ]
    option = options.find { |opt| opt[:id] == shipment_id }
    option ? option[:shipment_id] : '未設定'
  end
end
  
