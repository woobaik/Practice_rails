class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Your Article Has Been Posted."
      redirect_to @article
    else
      flash.now[:error] = "There Was an Error Posting Article."
      render 'new'
    end
  end

  def edit

  end

  def update
    if @article.update(article_params)
      flash[:success] = "Your Article Has Been Updated."
      redirect_to @article
    else
      flash.now[:error] = "There Was an Error Updating Your Article."
      render 'new'
    end
  end

  def show

  end

  def destroy
    if @article.delete
      flash[:success] = "Your Article Has Been Deleted."
      redirect_to articles_path
    else
      flash.now[:error] = "There Was an Error Deleting Your Article."
      redirect_to articles_path
    end
  end


  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find_by(id: params[:id])
  end
end
