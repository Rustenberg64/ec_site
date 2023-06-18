FactoryBot.define do
  factory :cart_item do
    association :customer, strategy: :create
    association :product, strategy: :create
    # customer_id { 0 }
    # product_id { 0 }
    quantity { 1 }
  end
end
