require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validation" do
    context "about valid case" do
      it "is valid without nil" do
        expect(FactoryBot.build(:product)).to be_valid
      end
    end

    context "about name" do
      it "is invalid without name" do
        expect(FactoryBot.build(:product, name: nil)).to be_invalid
      end
    end

    context "about manufacturer" do
      it "is invalid without manufacturer" do
        expect(FactoryBot.build(:product, manufacturer: nil)).to be_invalid
      end
    end

    context "about price" do
      it "is invalid without price" do
        expect(FactoryBot.build(:product, price: nil)).to be_invalid
      end
      it "is valid when price is 0" do
        expect(FactoryBot.build(:product, price: 0)).to be_valid
      end
      it "is valid when price is 1" do
        expect(FactoryBot.build(:product, price: 1)).to be_valid
      end
      it "is invalid when price is -1" do
        expect(FactoryBot.build(:product, price: -1)).to be_invalid
      end
      it "is invalid with string" do
        expect(FactoryBot.build(:product, price: "price")).to be_invalid
      end
    end

    context "about description" do
      it "is invalid without description" do
        expect(FactoryBot.build(:product, description: nil)).to be_invalid
      end
    end

    context "about stock" do
      it "is invalid without stock" do
        expect(FactoryBot.build(:product, stock: nil)).to be_invalid
      end
      it "is valid when stock is 0" do
        expect(FactoryBot.build(:product, stock: 0)).to be_valid
      end
      it "is valid when stock is 1" do
        expect(FactoryBot.build(:product, stock: 1)).to be_valid
      end
      it "is invalid when stock is -1" do
        expect(FactoryBot.build(:product, stock: -1)).to be_invalid
      end
      it "is invalid with string" do
        expect(FactoryBot.build(:product, stock: "stock")).to be_invalid
      end
    end

    context "about image" do
      it "is invalid without image" do
        expect(FactoryBot.build(:product, image: nil)).to be_invalid
      end
    end
  end
end
