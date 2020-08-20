class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :name, :user, :introduction,:price, :category,
            :item_condition, :postage_payer, :preparation_day,
            :postage_type, :image, :prefecture_code,
            presence: true

  validates :category_id, numericality: { other_than:1 }
end