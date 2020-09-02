class UserShoppingCart
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_code_id
  end

  def save
    shop = ShoppingCart.create(user_id: user_id, item_id: item_id)
    SendingDestination.create(shopping_cart_id: shop.id, post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end
