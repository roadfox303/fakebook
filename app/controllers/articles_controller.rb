class ArticlesController < ApplicationController
  before_action :set_id, only: [:edit, :update, :show, :destroy]
  def index
    @users = User.all
    @articles = current_user.articles.build(article_params)
    @article = Article.new
    @blog =
  end
  def create
    @article = Article.new(blog_params)
    @article.user_id = current_user.id
  end
  private
  def article_params
    params.require(:article).permit(:id, :content)
  end
  def set_id
    @whisper_log = Article.find(params[:id])
  end
end
