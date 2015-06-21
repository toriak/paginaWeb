class WelcomesController < ApplicationController

	skip_before_action :authenticate_user!, only: [:index]

	add_breadcrumb "Inicio", :root_path

	def index
	end

end