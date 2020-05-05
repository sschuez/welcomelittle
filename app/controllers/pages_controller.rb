class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :articles, :contact]
	
  def home
  end

  def contact
  end

end
