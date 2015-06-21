class ProfilesController < ApplicationController

	skip_before_action :authenticate_user!, only: [:index, :show]

	add_breadcrumb "Inicio", :root_path
  	add_breadcrumb "Perfiles", :profiles_path

	def index
		authorize Profile
		@profiles = Profile.all
	end

	def show
		@profile = Profile.find(params[:id])
		authorize @profile
		add_breadcrumb "Perfil de "+@profile.name, profile_path(@profile)
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.creator = current_user
		authorize @profile
		@profile.save!
		redirect_to @profile
	end

	def edit
  		@profile = Profile.find(params[:id])
  		authorize @profile
		add_breadcrumb "Edicion de perfil de "+@profile.name, edit_profile_path(@profile)
	end

	def update
		@profile = Profile.find(params[:id])
		authorize @profile
		if @profile.update(profile_params)
			redirect_to @profile
		else
			render 'edit'
		end
	end

	private
	def profile_params
		params.require(:profile).permit(:name,:birth_date, :email, instrument_ids: [])
	end
end