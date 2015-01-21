class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:user][:email])

		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			redirect_to apps_path
		else
			@errors = "invalid email or password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end