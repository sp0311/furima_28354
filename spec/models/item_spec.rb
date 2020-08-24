require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end

  describe '商品の情報を入力' do
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
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    
    it 'item_condition_idが空では保存できない' do
      @item.item_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end
    
    it 'postage_payer_idが空では保存できない' do
      @item.postage_payer_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer can't be blank")
    end

    it 'prefecture_code_idが空では保存できない' do
      @item.prefecture_code_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture code is not a number")
    end

    it 'preparation_day_idが空では保存できない' do
      @item.preparation_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation day can't be blank")
    end

    it 'priceが空では保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")

      # it 'priceの範囲が、¥300~¥9,999,999の間でないと保存できない' do
    #   @item.price= 
    #   @item.valid?
    #   expect(@item.errors.full_messages).to include("price  can't be blank")
    # end

    # @user.password = "1234a"
    # @user.valid?
    # expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")


    # it '紐づくユーザーが存在しないと保存できないこと' do
    #   @item.item = nil
    #   @item.valid?
    #   expect(@item.errors.full_messages).to include("User must exist")
    # end
   


    end
  end
end