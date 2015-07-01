class WelcomesController < ApplicationController

	skip_before_action :authenticate_user!, only: [:index]

	add_breadcrumb "Inicio", :root_path

	def index
		authorize Band
		@bands = Band.all

		authorize Profile
		@profiles = Profile.all

		#authorize Vacancy
		@vacancies = Vacancy.all
	end

end