require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる時' do
      it 'すべての情報に問題がなければ登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'categoryが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'fee_burdenが空では出品できない' do
        @item.fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee burden can't be blank")
      end

      it 'ship_areaが空では出品できない' do
        @item.ship_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship area can't be blank")
      end

      it 'ship_dayが空では出品できない' do
        @item.ship_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end

      it 'statusが空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300以下では出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end

      it 'priceが¥9999999以上では出品できない' do
        @item.price = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end

      it 'priceが半角数字以外では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.fee_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee burden can't be blank")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.ship_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship area can't be blank")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.ship_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
