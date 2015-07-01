class WelcomesController < ApplicationController

	skip_before_action :authenticate_user!, only: [:index]

	add_breadcrumb "Inicio", :root_path

	def index
		authorize Band
		@bands = Band.all.limit(5)
              .order(created_at: :desc)

		authorize Profile
		@profiles = Profile.all.limit(5)
              .order(created_at: :desc)

		#authorize Vacancy
		@vacancies = Vacancy.all.limit(5)
      				.order(created_at: :desc)

	end

end