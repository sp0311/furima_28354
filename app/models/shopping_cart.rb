class ShoppingCart < ApplicationRecord
  

belongs_to :user
belongs_to :item
# has_one :sending_destination
end