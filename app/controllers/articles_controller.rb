class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created"
      render 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article has been updated succesfully"
      redirect_to @article
    else
      flash[:danger] = "Article has not been updated properly!"
      render 'edit'
    end
  end
      
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
