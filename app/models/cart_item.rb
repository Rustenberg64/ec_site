class CartItem < ApplicationRecord
  with_options presence: true do
    validates :customer_id
    validates :product_id
    validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  end
  belongs_to :product
  belongs_to :customer
end
