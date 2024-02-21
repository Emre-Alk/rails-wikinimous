class ArticlesController < ApplicationController
before_action :id_params, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(set_params)
    @article.save
    redirect_to articles_path(@article)
  end

  def edit
  end

  def update
    @article.update(set_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path(@articles)
  end

  private

  def set_params
    params.require(:article).permit(:title, :content)
  end

  def id_params
    @article = Article.find(params[:id])
  end
end
