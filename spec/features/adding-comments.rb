require 'rails_helper'
RSpec.feature "Permit signed in users to add comments" do
  before do
    @nik = User.create!(email: "nik@gmail.com", password: "password")
    @min = User.create!(email: "min@gmail.com", password: "password")
    
    @article = Article.create(title: "First Article", body: "Body of an first article", user: @nik)
  end
  
  scenario "permits a signed in user to write a review" do
    login_as(@min)
    
    visit "/"
    click_link @article.title
    
    fill_in "New Comment", with: "Awesome Article"
    click_button "Add Comment"
    
    expect(page).to have_content("Comment has been created")
    expect(page).to have_content("Awesome article")
    expect(page.current_path).to eq(article_path(@article.comments.last.id))
  end
end