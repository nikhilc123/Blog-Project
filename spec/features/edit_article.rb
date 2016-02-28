require 'rails_helper'
RSpec.feature "Editing an Article" do
  before do
    @nik = User.create!(email: "nik@gmail.com", password: "password")
    login_as(@nik)
    @article = Article.create(title: "First Article", body: "Body of an Article", user: @nik)
  end
  
  scenario "A user updates an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: "Content of your choice"
    fill_in "Body", with: "Content of the body with your own choice"
    
    click_button "Update"
    
    expect(page).to have_content("Article has been edited succesfully")
    expect(page.current_path).to eq(edit_article_path(@article))
  end
  
  scenario "A user fails to update an Article" do
    visit "/"
    
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: "Some content of your own"
    
    click_button "Update Article"
    
    expect(page).to have_content("Article has not been edited properly")
    expect(page.current_path).to eq(edit_article_path(@article))
  end
end