class StaticPagesController < ApplicationController
  before_action :authenticate_user!,:only=>[:profile,:own_profile]

  def home
  	if user_signed_in?
      @property = current_user.properties.build 
  	  @feed_items = current_user.feed.paginate( page: params[:page] )
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def own_profile
    @user = current_user
    find_properties
  end

  def profile
    @user = User.find params[:id]
    find_properties
  end


  def find_properties
    @properties = @user.properties.paginate(page: params[:page])
  end
end
