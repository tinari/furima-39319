require 'rails_helper'

RSpec.describe Pay, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @pay = FactoryBot.build(:pay, user_id: user.id, item_id: item.id)
    end
  
      context '商品を購入できる場合' do
        it 'user_id,item_id,address, region_id,municipality,
        house_number,tel,tokenが存在すれば購入できる' do
        expect(@pay).to be_valid 
      end
      it 'building_nameは空でも購入できること' do
      @pay.building_name= ''
      expect(@pay).to be_valid
    end
  end
  
  context '商品を購入できない場合' do
    it 'user_idが空白の場合、購入できない' do
      @pay.user_id= nil
      @pay.valid?
      expect(@pay.errors.full_messages).to include("ユーザーログインしてください")
    end
    it 'item_idが空白の場合、購入できない' do
      @pay.item_id= nil
      @pay.valid?
      expect(@pay.errors.full_messages).to include("商品を確認してください")
    end
    it 'addressが空白の場合、購入できない' do
      @pay.address= ''
      @pay.valid?
      expect(@pay.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'addressは3桁ハイフン4桁半角でないと購入できない' do
      @pay.address= '1234567'
      @pay.valid?
      expect(@pay.errors.full_messages).to include("郵便番号はハイフンを含めた半角文字列で入力してください (例:123-4567)")
    end
    it 'region_idが空白の場合、購入できない' do
        @pay.region_id=''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("都道府県を入力してください")
      end
      it '配送先に1が選択してある場合、商品を出品できない' do
        @pay.region_id=1
        @pay.valid?
        expect(@pay.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'municipalityが空白の場合、購入できない' do
        @pay.municipality=''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空白の場合、購入できない' do
        @pay.house_number=''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("番地を入力してください")
      end
      it 'telが空白の場合、購入できない' do
        @pay.tel=''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'telは9桁以下だと購入できない' do
        @pay.tel= '12345678'
        @pay.valid?
        expect(@pay.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'telは12桁以上だと購入できない' do
        @pay.tel= '123456789012'
        @pay.valid?
        expect(@pay.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'telは半角数字でないと購入できないこと' do
        @pay.tel= '０123456789'
        @pay.valid?
        expect(@pay.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'tokenが空白の場合、購入できない' do
        @pay.token= ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
  

