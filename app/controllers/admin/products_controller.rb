class Admin::ProductsController < ApplicationController

  def index
    @pagy, @products = pagy(Product.with_attached_image)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Product was created!"
    else
      render "new", status: :unprocessable_entity
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
      redirect_to admin_products_path, notice: "Product was updated!"
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    if Product.find(params[:id]).destroy
      redirect_to admin_products_path, notice: "Product was deleted!"
    else
      render "index", status: :unprocessable_entity
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :manufacturer, :price,
                                  :description, :stock, :image)
    end
end
