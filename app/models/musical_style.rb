class MusicalStyle < ActiveRecord::Base
	has_and_belongs_to_many :bands
	has_and_belongs_to_many :profiles
end
