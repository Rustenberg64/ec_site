require 'rails_helper'

RSpec.describe "Products", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "user view products" do
    FactoryBot.create(:product, name: "sample1")
    FactoryBot.create(:product, name: "sample2")
    FactoryBot.create(:product, name: "sample3")

    visit root_path
    click_link "Products", match: :first
    expect(Product.count).to eq 3
    expect(page).to have_content "sample1"
    expect(page).to have_content "sample2"
    expect(page).to have_content "sample3"
  end
end
