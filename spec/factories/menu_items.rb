FactoryBot.define do
  factory :menu_item do
    name { Faker::Food.dish }
    price { 10000.0 }
  end
end
