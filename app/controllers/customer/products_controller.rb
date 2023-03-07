class Customer::ProductsController < ApplicationController

  def index
    @pagy, @products = pagy(Product.with_attached_image, items: 2)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = @product.cart_items.build
    @cart_item.quantity = 1
  end

end
