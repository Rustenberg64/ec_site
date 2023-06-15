require 'rails_helper'

RSpec.describe Customer, type: :model do
  # メール、パスワードがあれば有効な状態であること
  it "is valid with a email, and password" do
    customer = Customer.new(
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    expect(customer).to be_valid
  end

  it "is invalid without an email" do
    customer = Customer.new(
      email: "",
      password: "password"
    )
    customer.valid?
    expect(customer.errors[:email]).not_to be_empty
    # expect(customer).to be_invalid
  end

  it "is invalid with an email is not include @" do
    customer = Customer.new(
      email: "rhwfweofweo",
      password: "password"
    )
    customer.valid?
    expect(customer).to be_invalid
  end

  it "is invalid without a password" do
    customer = Customer.new(
      email: "abcd@example.com",
      password: ""
    )
    expect(customer).to be_invalid
  end

  # 名がなければ無効な状態であること
  it "is invalid without a first name"
  # 姓がなければ無効な状態であること
  it "is invalid without a last name"
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address"
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    Customer.create(
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    customer = Customer.new(
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    customer.valid?
    expect(customer.errors[:email]).to include("has already been taken")
  end
  # ユーザーのフルネームを⽂字列として返すこと
  it "returns a user's full name as a string"
end
