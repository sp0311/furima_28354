require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end

  describe '商品の情報を入力' do
    context '情報入力がうまくいくとき' do
      it '必須項目が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '情報入力がうまくいかないとき' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'introductionが空では保存できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'category_idが空では保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'item_condition_idが空では保存できない' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition is not a number')
      end

      it 'postage_payer_idが空では保存できない' do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer is not a number')
      end

      it 'prefecture_code_idが空では保存できない' do
        @item.prefecture_code_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture code is not a number')
      end

      it 'preparation_day_idが空では保存できない' do
        @item.preparation_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation day is not a number')
      end

      it 'priceが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが¥9,999,999以上だと登録できない' do
        @item.price += 9_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが、¥300以下だと保存できない' do
        @item.price -= 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが、¥9.999,999以上だと保存できない' do
        @item.price += 9_999_700
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
