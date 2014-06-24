class StaticPagesController < ApplicationController
  def home
  	@property = current_user.properties.build if signed_in?
  	@feed_items = current_user.feed.paginate( page: params[:page] )
  end

  def help
  end

  def about
  end

  def contact
  end
end
