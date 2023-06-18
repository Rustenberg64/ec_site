require 'rails_helper'

RSpec.describe Customer, type: :model do
  # メール、パスワードがあれば有効な状態であること

  describe "validation" do
    context "valid email and password" do
      it "is valid with a email, and password" do
        expect(FactoryBot.build(:customer)).to be_valid
      end
    end

    context "about email" do
      it "is invalid without an email" do
        expect(FactoryBot.build(:customer, email: nil)).to be_invalid
      end
      it "is invalid with an email is not include @" do
        expect(FactoryBot.build(:customer, email: "rhwfweofweo")).to be_invalid
      end
      # it "is invalid with an email length is 256" do
      #   expect(FactoryBot.build(:customer, email: "a" * 500 + "@example.com")).to be_valid
      # end
      it "is invalid with a duplicate email address" do
        FactoryBot.create(:customer, email: "customer@example.com")
        customer = FactoryBot.build(:customer, email: "customer@example.com")
        customer.valid?
        expect(customer.errors[:email]).to include("has already been taken")
      end
    end

    context "about password" do
      it "is invalid without an password" do
        expect(FactoryBot.build(:customer, password: nil)).to be_invalid
      end
      it "is invalid with a short password (1 length)" do
        expect(FactoryBot.build(:customer, password: "a")).to be_invalid
      end
      it "is invalid with a short password (5 length)" do
        expect(FactoryBot.build(:customer, password: "a" * 5)).to be_invalid
      end
      it "is valid with a short password (6 length)" do
        expect(FactoryBot.build(:customer, password: "a" * 6)).to be_valid
      end
    end
  end
end
