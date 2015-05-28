class Profile < ActiveRecord::Base

	validates :user_id,
		presence: true

	belongs_to :user, class_name: 'User'
end
