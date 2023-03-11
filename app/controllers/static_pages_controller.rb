class StaticPagesController < ApplicationController
  def home
    @products = Product.with_attached_image.order(created_at: :DESC).limit(3)
  end
end
