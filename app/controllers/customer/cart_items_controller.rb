class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.eager_load(product: {image_attachment: :blob})
    @total = @cart_items.sum("quantity * price")
    @total_quantity = @cart_items.sum(:quantity)
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: "Quantity was changed"
  end

  def destroy
    if current_customer.cart_items.find(params[:id]).destroy
      redirect_to cart_items_path, status: :see_other, notice: "A cart item was deleted"
    else
      render "index", status: :unprocessable_entity
    end
  end

  def create
    @cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
    if @cart_item
      @cart_item.increment!(:quantity, params[:cart_item][:quantity].to_i)
      redirect_to cart_items_path, notice: "Quantity was changed"
    else
      if current_customer.cart_items.create(cart_item_params)
        redirect_to cart_items_path, notice: "Add a item to cart"
      else
        render "index", status: :unprocessable_entity, alert: "Failed to add a item to card"
      end
    end
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:quantity, :product_id)
    end
end
