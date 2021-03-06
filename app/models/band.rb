class Band < ActiveRecord::Base

	validates :name,
		presence: true,
		length:{minimum: 1},
		uniqueness: true
	validates :mail,
		presence: true
	validates :creator,
		presence: true
	belongs_to :creator, class_name: 'User'

	has_and_belongs_to_many :musical_styles

	has_many :vacancies, :dependent => :destroy


end
