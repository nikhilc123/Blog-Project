require 'rails_helper'
RSpec.feature "Valid Credentials for signup" do
  scenario "A user fills in valid credentials" do
    visit "/"
    click_link "Sign up"
  
    fill_in "Username", with: "nik@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
  
    click_button "Sign Up"
    
    expect(page).to have_content("You have successfully signed in!")
  end
end