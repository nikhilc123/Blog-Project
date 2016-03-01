require 'rails_helper'
require 'support/macros'

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    before do
      @nik = User.create!(email: "nik@gmail.com", password: "password")
    end
    
    context "signed in user" do
      it "can create a comment" do
        login_user @nik
        article = Article.create( title: "First Title", body: "Awesome Article", user: @nik )
        article_id = article.id
        expect(flash[:success]).to eq("Comment has been created")
      end
    end
    
    context "Non signed in user" do
      it "redirected to sign in page" do
        login_user nil
        @article = Article.create(title: "first article", body: "Awesome article", user: @nik)
        post :create, comment: { body: "Awesome post" }
        article_id = article.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end

