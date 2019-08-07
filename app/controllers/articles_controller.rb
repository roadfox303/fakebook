class ArticlesController < ApplicationController
  before_action :set_id, only: [:edit, :update, :show, :destroy]
  def index
    @users = User.all
    @articles = Article.where user_id: current_user.id
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
  end
  private
  def article_params
    params.require(:article).permit(:id, :content, :image, :image_cache, :remove_image)
  end
  def set_id
    @article = Article.find(params[:id])
  end
end
