class Customer::ProductsController < ApplicationController
  def index
    sort_products = Product.get_all_and_sort(sort_param)
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
