class MusicalStyle < ActiveRecord::Base

		validates :name,
		presence: true,
		length:{minimum: 2},
		uniqueness: true

	has_and_belongs_to_many :bands
	has_and_belongs_to_many :profiles

	has_many :vacancies
end
