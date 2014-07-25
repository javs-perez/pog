class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception
   before_filter :configure_permitted_parameters, if: :devise_controller?
   layout :layout_user


   protected

   def layout_user
   	 if user_signed_in?
   	 	"application"
   	 elsif analyst_signed_in?
   	 	"analyst"
   	 end
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name)
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit!}
  end

 #  def current_property
	# 	@current_property ||= Property.find_by(current_user.properties.find(params[:id]))
	# end

end
