class VacanciesController < ApplicationController

	add_breadcrumb "Inicio", :root_path
  add_breadcrumb "vacantes", :vacancies_path

	def index
		#authorize Vacancy
		@vacancies = Vacancy.all
	end

	def show
		@vacancy = Vacancy.find(params[:id])
		#authorize @vacancy
		#add_breadcrumb @vacancy.name, vacancy_path(@vacancy)
	end

	def edit
  		@vacancy = Vacancy.find(params[:id])
  		@edit = true
  		#authorize @vacancy
  		#add_breadcrumb "Edicion de "+@vacancy.name, edit_vacancy_path(@vacancy)
	end
	def new
		#authorize Vacancy
		@vacancy = Vacancy.new
		@edit = false
		#add_breadcrumb "Creacion de vacancya", new_vacancy_path()
	end
	def create
		@vacancy = Vacancy.new(vacancy_params)
		#authorize @vacancy

		@vacancy.save!
		redirect_to @vacancy
	end

	def destroy
		@vacancy = Vacancy.find(params[:id])
		#authorize @vacancy
  		@vacancy.destroy
	  	redirect_to vacancies_path
	end

	def update
		@vacancy = Vacancy.find(params[:id])
		#authorize @vacancy
		if @vacancy.update(vacancy_params)
			redirect_to @vacancy
		else
			render 'edit'
		end
	end

	private
	def vacancy_params
		params.require(:vacancy).permit( :instrument_id, :band_id )
	end
end