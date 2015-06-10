class Profile < ActiveRecord::Base

	validates :user_id,
		presence: true
	validates :email,
		presence: true
	validates :name,
		presence: true

	belongs_to :user, class_name: 'User'

	has_and_belongs_to_many :instruments
end
