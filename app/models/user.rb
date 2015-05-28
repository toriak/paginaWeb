class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :band, foreign_key: "creator_id"
  after_create :saludar
  
  def saludar
	puts "Hola, soy #{email}"  
  end

end
