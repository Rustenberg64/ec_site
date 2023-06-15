class Customer::ProductsController < ApplicationController
  def index
    sort_products = Product.get_all_and_sort(sort_param)
    @pagy, @products = pagy(sort_products, items: 12)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def sort_param
    params[:sort]
  end
end
