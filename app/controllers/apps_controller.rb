class AppsController < ApplicationController

	before_action :authorize # calls to authorize before allowing any CRUD action to be done
	def index 
	  if params[:search] && params[:search].strip !="" # search query code
	  	@apps = App.where(file_name: Regexp.new(".*#{params[:search]}.*", Regexp::IGNORECASE), user_id: current_user.id)
	  	
	  else 


		@apps = App.where(user_id: current_user.id).order(date_created: :desc) # index of apps in order of date created descending
	  end 
	end

	def new
		@app = App.new
		@app.deploy = Deploy.new()
	end

	def create # creates new app
		@app = App.new(params.require(:app).permit(:file_name, :date_created, :location, :description, :reference))
		@app.deploy = Deploy.new(params.require(:app).require(:deploy_attributes).permit(:platform_used, :deployment_date, :deployed_name))
		@app.user = current_user # saves app to current user only

		if @app.save
			redirect_to apps_path
		else
			render :new
		end
	end

	def show # shows apps 
		@app = App.find(params[:id])
	end

	def edit 
		@app = App.find(params[:id])
	end

	def update # updates apps
		@app = App.find(params[:id])
		if @app.update_attributes(params.require(:app).permit(:file_name, :date_created, :location, :description, :reference)) && @app.deploy.update_attributes(params.require(:app).require(:deploy_attributes).permit(:platform_used, :deployment_date, :deployed_name))
			redirect_to app_path(@app)
		else
			render "edit"
		end
	end

	def destroy # deletes appss
		@app = App.find(params[:id])
		@app.destroy
		redirect_to apps_path
	end



end
