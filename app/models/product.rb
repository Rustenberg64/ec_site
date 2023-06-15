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

  def self.get_all_and_sort(sort_param)
    products = self.with_attached_image
    case sort_param
    when "price_low_to_high"
      products.order(:price)
    when "price_high_to_low"
      products.order(price: :DESC)
    when "date_old_to_new"
      products.order(:created_at)
    else
      products.order(created_at: :DESC)
    end
  end
end
