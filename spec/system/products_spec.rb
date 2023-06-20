require 'rails_helper'

RSpec.describe "Products", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "user view products" do
    product1 = FactoryBot.create(:product, name: "sample1")
    expect do
      FactoryBot.create(:product, name: "sample2")
      FactoryBot.create(:product, name: "sample3")
    end.to change { Product.count }.by(2)

    visit root_path
    click_link "Products", match: :first
    expect(Product.count).to eq 3
    expect(page).to have_content "sample1"
    expect(page).to have_content "sample2"
    expect(page).to have_content "sample3"
    click_link "sample1"
    expect(page).to have_content product1.name
    expect(page).to have_content product1.manufacturer
    expect(page).to have_content product1.price
    expect(page).to have_content product1.description
    expect(page).to have_content product1.stock
  end
end
