class StaticPagesController < ApplicationController
  def home
  	if user_signed_in?
      @property = current_user.properties.build if signed_in?
  	  @feed_items = current_user.feed.paginate( page: params[:page] )
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
