FactoryBot.define do
  factory :shopping_cart do
    association :user
    association :item
  end
end
