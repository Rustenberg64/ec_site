require 'rails_helper'

RSpec.describe "Logins", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "user log in as a created customer" do
    customer = FactoryBot.create(:customer)

    visit root_path
    click_link "Login"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"
    # expect(response).to redirect_to new_customer_session_path
    expect(page).to have_content "Invalid Email or password."
    expect(page.status_code).to eq 422

    fill_in "Email", with: customer.email
    fill_in "Password", with: customer.password
    click_button "Log in"
    expect(page.status_code).to eq 200
    expect(page).to have_link "Log out"
    expect(page).not_to have_link "Login"
    expect(page).not_to have_link "Sign up"
    click_link "Log out"
    expect(page.status_code).to eq 200
    expect(page).to have_link "Login"
    expect(page).to have_link "Sign up"
  end

  scenario "user sign up as a new customer" do
    FactoryBot.create(:customer, email: "example@example.com")
    customer = FactoryBot.build(:customer)
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign up"
    expect(page.status_code).to eq 422
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"

    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page.status_code).to eq 422
    expect(page).to have_content "Email has already been taken"

    fill_in "Email", with: customer.email
    fill_in "Password", with: customer.password
    fill_in "Password confirmation", with: customer.password
    click_button "Sign up"
    expect(page.status_code).to eq 200
    expect(page).to have_link "Log out"
    expect(page).not_to have_link "Login"
    expect(page).not_to have_link "Sign up"
    click_link "Log out"
    expect(page.status_code).to eq 200
    expect(page).to have_link "Login"
    expect(page).to have_link "Sign up"
  end

  scenario "user log in as a created admin" do
    admin = FactoryBot.create(:admin)

    visit root_path
    visit new_admin_session_path
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"
    expect(page.status_code).to eq 422
    expect(page).to have_content "Invalid Email or password."

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    expect(page.status_code).to eq 200
  end
end
