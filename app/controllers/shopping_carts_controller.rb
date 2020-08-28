class ShoppingCartsController < ApplicationController
  
  def index
    @shopping_carts = ShoppingCart.all
  end

 def create
   @shopping_cart = ShoppingCart.new(shopping_cart_params)
   if @shopping_cart.valid?
     pay_item
     @shopping_cart.save
     return redirect_to root_path
   else
     render 'index'
   end
 end
  
  private

  def shopping_cart_params
    params.permit(:token, :user, :item,)
  end

 def pay_item
   Payjp.api_key = "sk_test_XXXXXXXX"  # PAY.JPテスト秘密鍵
   Payjp::Charge.create(
     amount: shopping_cart_params[:user],  # 商品の値段
     card: shopping_cart_params[:token],    # カードトークン
     currency:'jpy'                         # 通貨の種類(日本円)
   )
 end

end