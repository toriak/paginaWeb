class VacanciesController < ApplicationController

  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "vacantes", :vacancies_path

	def index
    authorize Vacancy
    @vacancies = Vacancy.all.paginate(:page => params[:page], :per_page => 3)
                        .order(created_at: :desc)
	end

	def edit
    @vacancy = Vacancy.find(params[:id])
    authorize @vacancy
    #variables que se necesitan en el la vista
    @band = Band.find(@vacancy.band_id)
    @edit = true
    @mensaje_boton = "Actualizar"
    add_breadcrumb "Editando Vacante de \"#{@band.name}\"", edit_vacancy_path(@vacancy)
	end

	def new
    authorize Vacancy
    @vacancy = Vacancy.new
		@edit = false
		@mensaje_boton = "Crear Vacante"
		add_breadcrumb "Creacion de vacante", new_vacancy_path()
	end

	def create
		@vacancy = Vacancy.new(vacancy_params)
		authorize @vacancy
		if @vacancy.save
			flash[:notice] = "Se dio de alta una vacante"
			redirect_to vacancies_path
		else
			flash[:alert] = "Ah ocurrido un error"
			redirect_to new_vacancy_path
		end
	end

	def destroy
		@vacancy = Vacancy.find(params[:id])
		authorize @vacancy
  		@vacancy.destroy
  		flash[:notice] = "Se dio de baja a la vacante"
	  	redirect_to vacancies_path
	end

	def update
		@vacancy = Vacancy.find(params[:id])
		authorize @vacancy
		if @vacancy.update(vacancy_params)
			flash[:notice] = "Se actualizo los datos de la vacante"
			redirect_to vacancies_path
		else
			flash[:alert] = "Ha ocurrido un error en la actualizacion"
			redirect_to edit_vacancy_path(@vacancy)
		end
	end

	private
	def vacancy_params
		params.require(:vacancy).permit( :instrument_id, :band_id )
	end
end