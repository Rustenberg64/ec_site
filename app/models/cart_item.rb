class CartItem < ApplicationRecord
  with_options presence: true do
    validates :customer_id
    validates :product_id
    validates :quantity
  end
  belongs_to :product
  belongs_to :customer
end
