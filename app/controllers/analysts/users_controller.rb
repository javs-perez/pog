class Analysts::UsersController < ApplicationController
  before_action :authenticate_analyst!


  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
  	@user = User.find(params[:id])
    @properties = @user.properties.paginate(page: params[:page])
    @property = @user.properties.find_by(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to analysts_users_url
  end


end
