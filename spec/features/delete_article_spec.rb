require 'rails_helper'
RSpec.feature "Deleting an Article" do
  before do
    @article = Article.create(title: "First Title", body: "Deleting the body of an article")
  end
  
  scenario "Delete an Article" do
    visit "/"
    click_link @article.title
    click_link "Delete"
    
    expect(page).to have_content("Article has been deleted succesfully")
    expect(page.current_path).to eq(articles_path)
  end
end