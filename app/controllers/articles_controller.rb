class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show]

	def index
		@articles = policy_scope(Article).order(created_at: :desc)
	end

	def new
    @article = Article.new
    authorize @article
  end
  
  def create
    @article = Article.new(article_params)
    authorize @article

    if @article.save
			redirect_to article_path(@article)
			flash[:notice] = "Created new article."
		else
			render :new
		end
  end

  def edit
  end

  def update
  	if @article.update(article_params)
  		redirect_to article_path(@article)
  		flash[:notice] = "Article updated"
  	else
  		render :edit
  	end
  end
  
  def show
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :content, :description)
  end

  def set_article
  	@article = Article.find(params[:id])
  	authorize @article
  end

end