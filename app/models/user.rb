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
      user = User.last
      user.add_role :user
      perfil = Profile.create
      perfil.user_id=(user.id)
      perfil.email=(user.email)
      perfil.name=(user.email)
      perfil.save!
    end

end
