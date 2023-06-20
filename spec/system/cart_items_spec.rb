require 'rails_helper'

RSpec.describe "CartItems", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "user add a item to cart" do
    customer = FactoryBot.create(:customer)
    product1 = FactoryBot.create(:product, name: "sample1")
    FactoryBot.create(:product, name: "sample2")

    visit root_path
    click_link "Login"
    fill_in "Email", with: customer.email
    fill_in "Password", with: customer.password
    click_button "Log in"
    click_link "Products", match: :first
    expect(Product.count).to eq 2
    expect(page).to have_content "sample1"
    expect(page).to have_content "sample2"
    click_link "sample1"

    expect do
      fill_in "Quantity", with: 3
      click_button "Add Cart"
    end.to change { customer.cart_items.count }.by(1)
    expect(page.status_code).to eq 200
    expect(page).to have_content product1.name
    expect(page).to have_content product1.manufacturer
    expect(page).to have_content product1.price
    expect(page).to have_content product1.price * 3

    expect do
      find("#plusitem").click
    end.to change { customer.cart_items.first.quantity }.by(1)
    expect(page.status_code).to eq 200
    expect do
      find("#minusitem").click
    end.to change { customer.cart_items.first.quantity }.by(-1)
    expect(page.status_code).to eq 200

    expect do
      find("#deleteitem").click
    end.to change { customer.cart_items.count }.by(-1)
    expect(page.status_code).to eq 200
  end
end
