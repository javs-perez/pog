class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def current_property
		@current_property ||= Property.find_by(current_user.properties.find(params[:id]))
	end

end
