module ItemsHelper
  def delivery_charge_text(delivery_charge_id)
    options = [
      { id: 1, delivery_charge_id: '---' },
      { id: 2, delivery_charge_id: '着払い(購入者負担)' },
      { id: 3, delivery_charge_id: '送料込み(出品者負担)' }
    ]

    option = options.find { |opt| opt[:id] == delivery_charge_id }
    option ? option[:delivery_charge_id] : '未設定'
  end
end
  
