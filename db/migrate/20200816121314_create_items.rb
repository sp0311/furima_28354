class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.references :user, null: false
      t.text :introduction, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :category, null: false
      t.integer :item_condition, null: false
      t.integer :postage_payer, null: false
      t.integer :preparation_day, null: false
      t.integer :postage_type, null: false
      t.string :image, null: false
      t.integer :prefecture_code, null: false
    end
  end
end 