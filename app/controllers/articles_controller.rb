class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @categories = Category.all
    if params[:category].blank?
      @articles = Article.all_ordered_articles
    else
      @category = Category.find_by(name: params[:category])
      @articles = Article.articles_of_category(@category)
    end
  end

  def show
    @article = find_article
    @category = Category.find_by(id: @article.category_id)
  end

	def new
    @article = current_user.articles.build
	end

	def create
		@article = current_user.articles.build(article_params)
		return redirect_to @article if @article.save
    flash[:notice] = 'Error in form'
		render 'new'
	end

  def edit
    @article = find_article
  end

  def update
    @article = find_article
    return redirect_to @article if @article.update(article_params)
    flash[:notice] = 'Error in form'
    render 'edit'
  end

  def destroy
    @article = find_article
    return redirect_to @article unless current_user.id == @article.user_id
    @article.destroy
    redirect_to root_path
  end

	private

	def article_params
		params.require(:article).permit(:title, :content, :category_id)
	end

  def find_article
    Article.find(params[:id])
  end
end
