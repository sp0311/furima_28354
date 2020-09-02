require 'rails_helper'

RSpec.describe UserShoppingCart, type: :model do
  before do
    @pay = FactoryBot.build(:user_shopping_cart)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '必須項目が全て存在すれば登録できる' do
        expect(@pay).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと保存できない' do
        @pay.token = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと保存できない' do
        @pay.post_code = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid. Include hyphen(-)')
      end

      it 'post_codeがハイフンなしだと保存できない.' do
        @pay.post_code = 1_234_567
        @pay.valid?
        expect(@pay.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefecture_code_idが空だと保存できない' do
        @pay.prefecture_code_id = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include('Prefecture code is not a number')
      end

      it 'cityが空だと保存できない' do
        @pay.city = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できない' do
        @pay.house_number = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @pay.phone_number = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberはハイフンがあると保存できない' do
        @pay.phone_number = '090-1234-56'
        @pay.valid?
        expect(@pay.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberはハイフンが11桁以内でないと保存できない' do
        @pay.phone_number = '090123456789'
        @pay.valid?
        expect(@pay.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
