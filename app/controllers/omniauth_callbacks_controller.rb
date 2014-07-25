class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  

  def facebook
    @user = User.find_for_facebook_or_google_oauth(request.env["omniauth.auth"], current_user)
    if !@user.nil?
      session[:access_token] = request.env["omniauth.auth"].credentials.token
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else      
      session["devise.data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end

  def google_oauth2
    @user = User.find_for_facebook_or_google_oauth(request.env["omniauth.auth"], current_user)
    if !@user.nil?
      session[:access_token] = request.env["omniauth.auth"].credentials.token
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end

end
