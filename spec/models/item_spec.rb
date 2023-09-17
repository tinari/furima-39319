require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item= FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品を出品できる場合' do
      it 'item,images,user,:content, :price,:category_id, :situation_id, :delivery_charge_id,  
      :region_id, :shipment_idが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  end

  context '商品を出品できない場合' do
    it "ログアウト状態では、商品を出品できずにログインページに遷移する" do
      @item.user= nil
      @item.valid?
      expect(@item.errors.full_messages).to include("ユーザーを入力してください")
    end
    it '商品画像がない状態では、商品を出品できない' do
      @item.images= nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください", "画像は1枚以上5枚以下にしてください")
    end
    it '商品名が空白では、商品を出品できない' do
      @item.item= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品の説明が空白では、商品を出品できない' do
      @item.content= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it 'カテゴリーが空白では、商品を出品できない' do
      @item.category_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it 'カテゴリーに1が選択してある場合、商品を出品できない' do
      @item.category_id= 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it '商品の状態が空白では、商品を出品できない' do
      @item.situation_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")  
    end
    it '商品の状態に1が選択してある場合、商品を出品できない' do
      @item.situation_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")  
    end 
    it '配送料の負担が空白では、商品を出品できない' do
      @item.delivery_charge_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it '配送料の負担に1が選択してある場合、商品を出品できない' do
      @item.delivery_charge_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it '発送元の地域が空白では、商品を出品できない' do
      @item.region_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it '発送元の地域に1が選択してある場合、商品を出品できない' do
      @item.region_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it '発送までの日数が空白では、商品を出品できない' do
      @item.shipment_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end
    it '発送までの日数に1が選択してある場合、商品を出品できない' do
      @item.shipment_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end
    it '価格が空白では、商品を出品できない' do
      @item.price= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
    it '価格が300円未満であるとき、商品を出品できない' do
      @item.price= '290'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
    end
    it '価格が9999999円以上であるとき、商品を出品できない' do
      @item.price= '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
    end
    it '価格が半角数字以外の入力の時、商品を出品できない' do
      @item.price='１０００'
      expect(@item).to_not be_valid
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end
end
end
