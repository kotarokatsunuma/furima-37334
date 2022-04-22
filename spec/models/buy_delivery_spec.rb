require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  describe '購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)

      @buy_delivery = FactoryBot.build(:buy_delivery, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_delivery).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @buy_delivery.building_name = ''
        expect(@buy_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @buy_delivery.postcode = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_delivery.postcode = '1234567'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @buy_delivery.prefecture_id = 0
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @buy_delivery.municipality = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressだと保存できないこと' do
        @buy_delivery.address = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'phonenumberが空だと保存できないこと' do
        @buy_delivery.phonenumber = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'phonenumberは9桁以下では購入できないこと' do
        @buy_delivery.phonenumber = '090123456'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Phonenumber is invalid')
      end
      it 'phonenumberは12桁以上では購入できないこと' do
        @buy_delivery.phonenumber = '090123456789'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Phonenumber is invalid')
      end
      it 'phonenumberは半角数字以外が含まれている場合は購入できないこと' do
        @buy_delivery.phonenumber = '090-1234-5678'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include('Phonenumber is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_delivery.user_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_delivery.item_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @buy_delivery.token = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
