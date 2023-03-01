class ProductsController < ApplicationController

  def index
    @pagy, @produts = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    else
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
    else
    end
  end

  def destroy
    Product.find(params[:id]).destroy
  end

  private

    def product_params
      params.require(:product).permit(:name, :manufacturer, :price,
                                  :description, :stock)
    end
end
