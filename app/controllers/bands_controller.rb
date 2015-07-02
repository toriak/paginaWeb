class BandsController < ApplicationController

	skip_before_action :authenticate_user!, only: [:index, :show]
	add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Bandas", :bands_path

	def index
		authorize Band
		@bands = Band.all.paginate(:page => params[:page], :per_page => 5)
      .order(created_at: :desc)

	end

	def new
		authorize Band
		@band = Band.new
		add_breadcrumb "Creacion de Banda", new_band_path()
		@mensaje_boton = "Crear Banda"
	end
	def show
		@band = Band.find(params[:id])
		authorize @band
		add_breadcrumb @band.name, band_path(@band)
	end
	def edit
  		@band = Band.find(params[:id])
  		authorize @band
  		add_breadcrumb "Edicion de "+@band.name, edit_band_path(@band)
  		@mensaje_boton = "Actualizar"
	end
	def create
		@band = Band.new(band_params)
		@band.creator = current_user
		authorize @band
		if @band.save
      		flash[:notice] = "Se creo la banda #{@band.name}"
		  	redirect_to @band
    	else
      		flash[:alert] = "Ha ocurrido un error"
      		redirect_to new_band_path
    	end
	end

	def destroy
		@band = Band.find(params[:id])
		authorize @band
  	@band.destroy
    flash[:notice] = "Se elimino la banda"
	  redirect_to bands_path
	end

	def update
		@band = Band.find(params[:id])
		authorize @band
		if @band.update(band_params)
      		flash[:notice] = "Se actualizo los datos correctamente"
			redirect_to @band
		else
      		flash[:alert] = "Ha ocurrido un error en la actualizacion"
      		redirect_to edit_band_path @band
		end
	end

	private
	def band_params
		params.require(:band).permit(:name,:creation_date, :mail ,musical_style_ids: [])
	end
end