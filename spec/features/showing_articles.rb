require 'rails_helper'
RSpec.feature "Show all the Articles" do
  before do
    # create 2 users: 1 for (signed_in) and other for (non-owner)
    @nik = User.create!(email: "nik@gmail.com", password: "password")
    @min = User.create!(email: "min@gmail.com", password: "password")
    @article = Article.create(title: "This is the first Article", body: "Rspec Feature on show page", user: @nik)
  end
  
  scenario "A non-signed_in users should not Edit or Delete link" do
    visit "/"
    click_link(@article.title)
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
  
  scenario "A non owner should not Edit or Delete Link" do
    login_as(@min)
    visit "/"
    click_link(@article.title)
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page).not_to have_link ("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
  
   scenario "A signed_in users should Edit or Delete link" do
    visit "/"
    click_link(@article.title)
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end

  
  scenario "Should show associated article" do
    visit "/"
    click_link(@article.title)
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
  end
end
    