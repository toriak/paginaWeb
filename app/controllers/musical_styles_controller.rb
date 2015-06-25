class MusicalStylesController < ApplicationController

	skip_before_action :authenticate_user!

	add_breadcrumb "Inicio", :root_path
  	add_breadcrumb "Lista de Estilos", :musical_styles_path

	def index
		#authorize MusicalStyle
		@musical_styles = MusicalStyle.all
	end
	def new
		#authorize MusicalStyle
		@musical_style = MusicalStyle.new
		add_breadcrumb "Creacion de nuevo Estilo", new_musical_style_path()
	end
	def create
		@musical_style = MusicalStyle.new(musical_style_params)
		#authorize @musical_style
		@musical_style.save!
		redirect_to musical_styles_path()
	end

	private
	def musical_style_params
		params.require(:musical_style).permit(:name)
	end
end