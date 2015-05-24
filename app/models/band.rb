class Band < ActiveRecord::Base

	validates :name,
		presence: true,
		length:{minimum: 5}
	validates :mail,
		presence: true
	validates :creation_date,
		presence: true
end
