class ArticlesController < ApplicationController

	def new
    @article = Article.new
    authorize @article
  end
  
  def create
    article = Article.create! article_params
    redirect_to article
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :content, :description)
  end

end