require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe '商品購入機能' do
  before do
    @user= FactoryBot.create(:user)
    @item= FactoryBot.create(:item)
    @buy = FactoryBot.build(:buy, user: @user, item: @item)
  end

    context '商品を購入できる場合' do
      it 'item_id,user_id,:address, :region_id,:municipality,
      :house_number,:telが存在すれば購入できる' do
      expect(@buy).to be_valid

    end
  end

context '商品を購入できない場合' do
  it ':addressが空白の場合、購入できない' do
    @buy.address= ''
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Address can't be blank")
  end
  it 'addressはハイフンがないと購入できない' do
    @buy.address= '1234567'
    @buy.valid?
    expect(@buy.errorss.full_messages).to include("Address can't be "-"")
  end
  it ':region_idが空白の場合、購入できない' do
      @buy.region_id=''
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Region can't be blank")
    end
    it '配送先に1が選択してある場合、商品を出品できない' do
      @buy.region_id=1
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Region can't be blank")
    end
    it 'municipalityが空白の場合、購入できない' do
      @buy.municipality=''
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'house_numberが空白の場合、購入できない' do
      @buy.house_number=''
      @buy.valid?
      expect(@buy.errors.full_messages).to include("House_number can't be blank")
    end
    it 'telが空白の場合、購入できない' do
      @buy.tel=''
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Tel can't be blank")
    end
    it 'telはハイフンがあると購入できない' do
      @buy.address= '123-456-7890'
      @buy.valid?
      expect(@buy.errorss.full_messages).to include("Tel not't be "-"")
    end
end
end
end
