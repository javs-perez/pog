class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
    analyst = Analyst.find_by(email: params[:session][:email].downcase)

   	if analyst.nil?
    	if user && user.authenticate(params[:session][:password])
      	sign_in user
      	redirect_back_or user
    	else
      	flash.now[:error] = 'Invalid email/password combination'
      	render 'new'
    	end
    else
    	if analyst && analyst.authenticate(params[:session][:password])
    		sign_in analyst
    		redirect_back_or signin_analyst_path
    	else
    		flash.now[:error] = 'Invalid email/password combination'
    		render 'analysts/new'
    	end
		end
	end

	def destroy
		sign_out
    redirect_to root_url
	end

  def destroyanalyst
    analyst_sign_out
    redirect_to root_url
  end
end
