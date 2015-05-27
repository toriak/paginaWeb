class ProfilesController < ApplicationController

	skip_before_action :authenticate_user!, only: [:index, :show]

	def index
		@profiles = Profile.all
	end

	def show
		@profile = Profile.find(params[:id])
	end
	def new
		@profile = Profile.new
	end
	def create
		@profile = Profile.new(profile_params)
		@profile.creator = current_user
		@profile.save!
		redirect_to @profile
	end

	def destroy
		@profile = Profile.find(params[:id])
  		@profile.destroy
	  	redirect_to profiles_path
	end

	def edit
  		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])

		if @profile.update(profile_params)
			redirect_to @profile
		else
			render 'edit'
		end
	end

	private
	def profile_params
		params.require(:profile).permit(:name,:creation_date, :mail)
	end
end