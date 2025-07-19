FactoryBot.define do
  factory :product do
    sequence(:title) { |i| "Product #{i}" }
    sequence(:slug) { |i| "product-#{i}" }
    description { "MyText" }
    price { 1 }
    old_price { 1 }
  end
end
