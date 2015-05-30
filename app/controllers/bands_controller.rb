class BandsController < ApplicationController

	skip_before_action :authenticate_user!, only: [:index, :show]

	def index
		authorize Band
		@bands = Band.all
	end

	def show
		@band = Band.find(params[:id])
		authorize @band
	end
	def new
		authorize Band
		@band = Band.new
	end
	def create
		@band = Band.new(band_params)
		@band.creator = current_user
		authorize @band
		@band.save!
		redirect_to @band
	end

	def destroy
		@band = Band.find(params[:id])
		authorize @band
  		@band.destroy
	  	redirect_to bands_path
	end

	def edit
  		@band = Band.find(params[:id])
  		authorize @band

	end

	def update
		@band = Band.find(params[:id])
		authorize @band
		if @band.update(band_params)
			redirect_to @band
		else
			render 'edit'
		end
	end

	private
	def band_params
		params.require(:band).permit(:name,:creation_date, :mail)
	end
end