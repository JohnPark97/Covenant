# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new # This is a new instance of the Article class
  end

  def create
    @article = Article.new(article_params) # This is a new instance of the Article class

    if @article.save
      redirect_to @article # This is a redirect to the show action
    else
      render 'new', status: :unprocessable_entity # This is a render of the new template
    end
  end

  def edit
    @article = Article.find(params[:id]) # This is a new instance of the Article class
  end

  def update
    @article = Article.find(params[:id]) # This is a new instance of the Article class

    if @article.update(article_params)
      redirect_to @article # This is a redirect to the show action
    else
      render :edit, status: :unprocessable_entity # This is a render of the edit template
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to "/articles/1", status: :see_other # This is a redirect to the index action
  end

  private
    def article_params
      # submitted data from new.html.erb is available in params[:article]
      params.require(:article).permit(:title, :body)
    end
end
