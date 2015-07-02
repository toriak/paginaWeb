class InstrumentsController < ApplicationController


	add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Intrumentos", :instruments_path

	def index
		authorize Instrument
		@instruments = Instrument.all.paginate(:page => params[:page], :per_page => 4)
      .order(created_at: :desc)
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
			flash[:notice] = "Se creo el instrumento #{@instrument.name}"
			redirect_to instruments_path
		else
			flash[:alert] = "Ha ocurrido un error"
			redirect_to new_instrument_path
		end
	end

	private

	def instrument_params
		params.require(:instrument).permit(:name)
	end
end