class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
  end
 

  with_options presence: true do
    validates :name, length: { maximum: 40 }
  end

  with_options presence: true do
    validates :introduction, length: { maximum: 1000 }
  end

  with_options presence: true do
    validates :category
    validates :item_condition
    validates :postage_payer
    validates :preparation_day
  end

  with_options presence: true do
    validates_inclusion_of :price, in: 300..9_999_999
  end

  validates :category_id, :item_condition_id, :postage_payer_id, :preparation_day_id, :prefecture_code_id,
            numericality: { other_than: 1 }
  
  has_one_attached :image
  belongs_to :user, optional: true 
  # foreign_key: :user_id, dependent: :destroy
  # has_many :comments, dependent: :destroy
  belongs_to_active_hash :category, dependent: :destroy
  belongs_to_active_hash :item_condition, dependent: :destroy
  belongs_to_active_hash :postage_payer, dependent: :destroy
  belongs_to_active_hash :preparation_day, dependent: :destroy
  belongs_to_active_hash :prefecture_code, dependent: :destroy
end
