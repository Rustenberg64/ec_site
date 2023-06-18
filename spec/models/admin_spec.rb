require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  describe "validation" do
    context "valid email and password" do
      it "is valid with a email, and password" do
        expect(FactoryBot.build(:admin)).to be_valid
      end
    end

    context "about email" do
      it "is invalid without an email" do
        expect(FactoryBot.build(:admin, email: nil)).to be_invalid
      end
      it "is invalid with an email is not include @" do
        expect(FactoryBot.build(:admin, email: "rhwfweofweo")).to be_invalid
      end
      # it "is invalid with an email length is 256" do
      #   expect(FactoryBot.build(:admin, email: "a" * 500 + "@example.com")).to be_valid
      # end
      it "is invalid with a duplicate email address" do
        FactoryBot.create(:admin, email: "admin@example.com")
        admin = FactoryBot.build(:admin, email: "admin@example.com")
        admin.valid?
        expect(admin.errors[:email]).to include("has already been taken")
      end
    end

    context "about password" do
      it "is invalid without an password" do
        expect(FactoryBot.build(:admin, password: nil)).to be_invalid
      end
      it "is invalid with a short password (1 length)" do
        expect(FactoryBot.build(:admin, password: "a")).to be_invalid
      end
      it "is invalid with a short password (5 length)" do
        expect(FactoryBot.build(:admin, password: "a" * 5)).to be_invalid
      end
      it "is valid with a short password (6 length)" do
        expect(FactoryBot.build(:admin, password: "a" * 6)).to be_valid
      end
    end
  end
end
