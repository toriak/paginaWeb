class MusicalStylesController < ApplicationController


  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Lista de Estilos", :musical_styles_path

	def index
		authorize MusicalStyle
		@musical_styles = MusicalStyle.all.paginate(:page => params[:page], :per_page => 4)
      .order(created_at: :desc)
	end
	def new
		authorize MusicalStyle
		@musical_style = MusicalStyle.new
		add_breadcrumb "Creacion de nuevo Estilo", new_musical_style_path()
	end
	def create
		@musical_style = MusicalStyle.new(musical_style_params)
		authorize @musical_style
		if @musical_style.save
			flash[:notice] = "Se creo el estilo #{@musical_style.name}"
			redirect_to musical_styles_path()
		else
			flash[:alert] = "Ha ocurrido un error"
			redirect_to  new_musical_style_path
		end

	end

	private
	def musical_style_params
		params.require(:musical_style).permit(:name)
	end
end