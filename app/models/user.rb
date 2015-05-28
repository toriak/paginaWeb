class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :band, foreign_key: "creator_id"

  has_one :profile, foreign_key: "user_id"

  #hubs
  after_create :add_profile_user , on: :create
  protected
    def add_profile_user
      user2 = User.last
      perfil = Profile.create
      perfil.user_id=(user2.id)
      perfil.email=(user2.email)
      perfil.save!
    end

end
