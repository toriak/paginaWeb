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
  #after_validation :add_profile_user, on: :update

  protected
    def add_profile_user
      puts "Hola, soy #{email}"
      user2 = User.last
      perfil = Profile.create
      perfil.user_id=(user2.id)
      perfil.save!
      puts "mi id es #{user2.id}"
    end

end
