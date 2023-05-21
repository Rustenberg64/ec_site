class Customer::ProductsController < ApplicationController
  def index
    products = Product.with_attached_image
    sort_products = if sort_param == "price_low_to_high"
                      products.order(:price)
                    elsif sort_param == "price_high_to_low"
                      products.order(price: :DESC)
                    elsif sort_param == "date_old_to_new"
                      products.order(:created_at)
                    else
                      products.order(created_at: :DESC)
                    end
    @pagy, @products = pagy(sort_products, items: 12)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = @product.cart_items.build
    @cart_item.quantity = 1
  end

  private

  def sort_param
    params[:sort]
  end
end
