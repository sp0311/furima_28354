class ShoppingCartsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if    @item.shopping_cart.present?
          redirect_to root_path
    elsif current_user.id == @item.user.id
          redirect_to root_path
    else
          @shopping_cart = UserShoppingCart.new
     end
  end

  def

  def create
    @shopping_cart = UserShoppingCart.new(shopping_cart_params)
    if @shopping_cart.valid?
      @shopping_cart.save
      pay_item
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def shopping_cart_params
    params.require(:user_shopping_cart).permit(:token, :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id]).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,                   # 商品の値段
      card: shopping_cart_params[:token],    # カードトークン
      currency: 'jpy'                         # 通貨の種類(日本円)
    )
  end
end