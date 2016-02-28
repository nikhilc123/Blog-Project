require 'rails_helper'
RSpec.feature "Sign out signed users" do
  before do
    @nik = User.create!(email: "nik@gmail.com", password: "password1")
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: @nik.email
    fill_in "Password", with: @nik.password
    click_button "Log in"
  end
  
  scenario do
    visit "/"
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
  end
end