class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :articles, :contact]
	
  def home
  	@articles = Article.all
  end

  def contact
  end

end
