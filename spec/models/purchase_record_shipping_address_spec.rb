require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  describe '商品の購入' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address, item_id: item.id, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_shipping_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_record_shipping_address.building = ''
        expect(@purchase_record_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @purchase_record_shipping_address.postcode = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_record_shipping_address.postcode = '1234567'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_record_shipping_address.prefecture_id = '1'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_record_shipping_address.city = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空だと保存できないこと' do
        @purchase_record_shipping_address.block = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'Phone_numberが空だと保存できないこと' do
        @purchase_record_shipping_address.phone_number = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'Phone_numberが半角でないと保存できないこと' do
        @purchase_record_shipping_address.phone_number = '１２３４５６７８９０'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'Phone_numberが10桁以上でないと保存できないこと' do
        @purchase_record_shipping_address.phone_number = '1234567'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'Phone_numberが11桁以内でないと保存できないこと' do
        @purchase_record_shipping_address.phone_number = '123456789123'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_record_shipping_address.token = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_record_shipping_address.user_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_record_shipping_address.item_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
