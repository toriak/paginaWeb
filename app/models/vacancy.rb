class Vacancy < ActiveRecord::Base


	validates :band_id,
		presence: true
	validates :instrument_id,
		presence: true

	belongs_to :band
	belongs_to :instrument
end
