require 'rails_helper'
require 'support/macros'

RSpec.describe ArticlesController, type: :controller do
  before do
    @nik = User.create(email: "nik@gmail.com", password: "password")
  end
    
  context "Owner is allowed to edit his Articles" do
    it "renders the edit template" do
      login_user @nik
      article = Article.create(title: "First Article", body: "Body of first article", user: @nik)
      get :edit, id: article
      expect(response).to render_template :edit
    end
  end
  
  context "non-owner is not allowed to edit other users articles" do
    it "redirect to the root path" do
      fred = User.create(email: "fred@example.com", password: "password")
      login_user fred
      
      #user is nik and not fred because nik is not owner and should pass our test
      
      article = Article.create(title: "First article", body: "Body of first article", user: @nik)
      get :edit, id: article
      expect(response).to redirect_to(root_path)
      message = "You can only edit your own article."
      expect(flash[:danger]).to eq message
    end
  end
    
end

