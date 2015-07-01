class Vacancy < ActiveRecord::Base

	belongs_to :band
	belongs_to :instrument

	validates :band_id,
		presence: true
	validates :instrument_id,
		presence: true

end
