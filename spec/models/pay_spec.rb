require 'rails_helper'

RSpec.describe Pay, type: :model do
  describe '商品購入機能' do
    before do
  
      @pay = FactoryBot.build(:pay)
    end
  
      context '商品を購入できる場合' do
        it 'item_id,user_id,address, region_id,municipality,
        house_number,tel,tokenが存在すれば購入できる' do
        expect(@pay).to be_valid 
      end
      it 'building_nameは空でも購入できること' do
      @pay.building_name= ''
      expect(@pay).to be_valid
    end
  end
  
  context '商品を購入できない場合' do
    it 'addressが空白の場合、購入できない' do
      @pay.address= ''
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Address can't be blank")
    end
    it 'addressは3桁ハイフン4桁半角でないと購入できない' do
      @pay.address= '1234567'
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Address is invalid. Include hyphen(-)")
    end
    it 'region_idが空白の場合、購入できない' do
        @pay.region_id=''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Region can't be blank")
      end
      it '配送先に1が選択してある場合、商品を出品できない' do
        @pay.region_id=1
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Region can't be blank")
      end
      it 'municipalityが空白の場合、購入できない' do
        @pay.municipality=''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空白の場合、購入できない' do
        @pay.house_number=''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("House number can't be blank")
      end
      it 'telが空白の場合、購入できない' do
        @pay.tel=''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telは9桁以下だと購入できない' do
        @pay.tel= '12345678'
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel is invalid")
      end
      it 'telは12桁以上だと購入できない' do
        @pay.tel= '123456789012'
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel is invalid")
      end
      it 'telは半角数字でないと購入できないこと' do
        @pay.tel= '０123456789'
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel is invalid")
      end
      it 'tokenが空白の場合、購入できない' do
        @pay.token= ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
  

