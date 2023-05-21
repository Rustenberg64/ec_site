class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :manufacturer
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :description
    validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :image
  end
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
end
