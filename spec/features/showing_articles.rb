require 'rails_helper'
RSpec.feature "Show all the Articles" do
  before do
    @article = Article.create(title: "This is the first Article", body: "Rspec Feature on show page")
  end
  scenario "Should show associated article" do
    visit "/"
    click_link(@article.title)
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
  end
end
    