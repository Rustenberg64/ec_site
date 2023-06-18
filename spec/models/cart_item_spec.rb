require 'rails_helper'

RSpec.describe CartItem, type: :model do

  describe "validation" do
    context "about valid case" do
      it "is valid without nil" do
        expect(FactoryBot.create(:cart_item)).to be_valid
        expect(CartItem.count).to eq 1
      end
    end

    context "about quantity" do
      it "is invalid without quantity" do
        expect(FactoryBot.build(:cart_item, quantity: nil)).to be_invalid
      end
      it "is invalid when quantity is 0" do
        expect(FactoryBot.build(:cart_item, quantity: 0)).to be_invalid
      end
      it "is invalid when quantity is 1" do
        expect(FactoryBot.build(:cart_item, quantity: 1)).to be_valid
      end
    end

    context "about product_id" do
      it "is invalid without product_id" do
        customer = FactoryBot.create(:customer)
        cart_item = customer.cart_items.build
        expect(cart_item).to be_invalid
      end

      it "is deleted when product is deleted" do
        product = FactoryBot.create(:product)
        customer = FactoryBot.create(:customer)
        product.cart_items.create(customer_id: customer.id)
        product.destroy
        expect(CartItem.count).to eq 0
      end
    end

    context "about customer_id" do
      it "is invalid without customer_id" do
        product = FactoryBot.create(:product)
        cart_item = product.cart_items.build
        expect(cart_item).to be_invalid
      end

      it "is deleted when product is deleted" do
        product = FactoryBot.create(:product)
        customer = FactoryBot.create(:customer)
        customer.cart_items.create(product_id: product.id)
        customer.destroy
        expect(CartItem.count).to eq 0
      end
    end

  end
end
