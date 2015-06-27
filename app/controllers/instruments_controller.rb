class InstrumentsController < ApplicationController

	skip_before_action :authenticate_user!, only: [:index]

	add_breadcrumb "Inicio", :root_path
  	add_breadcrumb "Intrumentos", :instruments_path

	def index
		authorize Instrument
		@instruments = Instrument.all
	end

	def new
		authorize Instrument
		@instrument = Instrument.new
		add_breadcrumb "Creacion de Instrumento", new_instrument_path()
	end

	def create
		@instrument = Instrument.new(instrument_params)
		authorize @instrument
		if @instrument.save
			flash[:notice] = "El instrumento #{@instrument.name} se a creado corectamente"
			redirect_to instruments_path
		else
			flash[:alert] = "Ah ocurrido un error. Vuelva a intentarlo"
			redirect_to new_instrument_path
		end
	end

	private

	def instrument_params
		params.require(:instrument).permit(:name)
	end
end