class ArticlesController < ApplicationController
  before_action :set_id, only: [:edit, :update, :show, :destroy]
  def index
    @users = User.all
    @articles = Article.where(user_id: current_user.id).reverse
    @article = Article.new
  end
  def new
    if params[:back]
      @article = Article.new(article_params)
    else
      @article = Article.new
    end
  end
  def confirm
    @article = Article.new(article_params)
  end
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if params[:back]
      render :index
    elsif @article.save
      article_check(@article.save, "create")
    end

  end
  private
  def article_params
    params.require(:article).permit(:id, :content, :image, :image_cache, :remove_image)
  end
  def set_id
    @article = Article.find(params[:id])
  end
  def article_check(check, name)
    if check
      case name
      when "create" then
      redirect_to articles_path, notice: "記事を投稿しました"
      when "update" then
      redirect_to articles_path, notice: "記事を編集しました"
      end
    else
      redirect_to articles_path, notice: "バリデーションエラー"
    end
  end
end
