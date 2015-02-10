class SessionsController < ApplicationController

	def new

	end

	def create # creates sessions for users 
		user = User.find_by(email: params[:user][:email])

		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			redirect_to apps_path
		else
			flash.now[:danger] = "invalid email or password"
			render :new
		end
	end

	def destroy # logs out session
		session[:user_id] = nil
		redirect_to '/login'
	end

end