require 'rails_helper'
RSpec.feature "Listing Articles" do
  before do
    @article1 = Article.create(title: "This is first Article", body: "Rspec features with listing articles")
    @article2 = Article.create(title: "This is second Article", body: "Time to learn Rspec")
  end
    
    scenario "List all the articles on the index page" do
    visit "/"
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
end