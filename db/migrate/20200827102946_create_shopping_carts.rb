class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.references :user, null:false, foreign_key: true
      t.references :item, null:false, foreign_key: true
    end
  end
end
