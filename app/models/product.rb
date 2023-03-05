class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :manufacturer
    validates :price
    validates :description
    validates :stock
    validates :image
  end
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
end
