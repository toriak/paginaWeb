class Band < ActiveRecord::Base

	validates :name,
		presence: true,
		length:{minimum: 5}
	validates :mail,
		presence: true

	belongs_to :creator, class_name: 'User'
end
