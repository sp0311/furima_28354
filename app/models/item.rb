class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
    validates :price
  end

  with_options presence: true do
    validates :name, length: { maximum: 40 }
  end

  with_options presence: true do
    validates :introduction, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :preparation_day_id
    validates :prefecture_code_id
  end

  validates_inclusion_of :price, in: 300..9_999_999

  has_one_attached :image
  belongs_to :user, optional: true
  # foreign_key: :user_id, dependent: :destroy
  belongs_to_active_hash :category, dependent: :destroy
  belongs_to_active_hash :item_condition, dependent: :destroy
  belongs_to_active_hash :postage_payer, dependent: :destroy
  belongs_to_active_hash :preparation_day, dependent: :destroy
  belongs_to_active_hash :prefecture_code, dependent: :destroy
  has_one :shopping_cart
end
