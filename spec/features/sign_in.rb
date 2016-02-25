require 'rails_helper'
RSpec.feature "Valid Credentials" do
  before do
    @nik = User.create!(email: "nik@gmail.com", password: "password1")
  end
  
  scenario "A user enters valid credentials to complete login" do
    visit "/"
    click_link "Sign up"
    
    fill_in "Email", with: "@nik.email"
    fill_in "Password", with: "@nik.password1"
    
    click_button "Login"
    
    expect(page).to have_content("You have succesfully signed in!")
    expect(page).to have_content("You have logged in as #{@nik.email}")
  end
end