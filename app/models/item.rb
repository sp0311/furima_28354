class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture_code

  validates :name, :user, :introduction,:price, :category,
            :item_condition, :postage_payer, :preparation_day,
            :postage_type, :image, :prefecture_code,
            presence: true

  validates :category_id, :item_condition_id, :postage_payer_id, :preparation_day_id, :prefecture_code,
            numericality: { other_than: 1 }
end