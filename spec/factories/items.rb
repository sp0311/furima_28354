FactoryBot.define do
  factory :item do
    name                        { "tarou" }
    introduction                { "手のひらサイズのぬいぐるみです。" }
    price                       { "400円" }
    category_id                 { "2" }
    item_condition_id           { "2" }
    postage_payer_id            { "2" }
    prefecture_code_id          { "2" }
    preparation_day_id          { "2" }
    
  end
end
