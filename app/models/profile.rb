class Profile < ActiveRecord::Base

	validates :user_id,
		presence: true
	validates :email,
		presence: true

	belongs_to :user, class_name: 'User'
end
