class SitemapsController < ApplicationController
	skip_before_action :authenticate_user!

  layout :false
  before_action :init_sitemap

  def index
    @inquiries = Inquiry.all
  end

  private

  def init_sitemap
    headers['Content-Type'] = 'application/xml'
  end

end