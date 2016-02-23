require 'rails_helper'
  RSpec.feature "Creating Article spec" do
    scenario "A user creates a new article" do
      visit "/"
      
      click_link "New Article"
      fill_in "title", with: "Creating a first article"
      fill_in "body", with: "Lorem ipsum"
      click_button "Create Article"
      
      expect(page).to have_content("Article has been created")
      expect(page.current_path).to eq(articles_path)
    end
  end