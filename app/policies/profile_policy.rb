class ProfilePolicy < ApplicationPolicy

  def index?
  	true
  end

  def show?
    true
  end

  def update?
    (user.present?)&&((record.user == user) || (user.has_role? :admin))
  end

  def index(record)
  	id_user = record.user_id
    user = User.find(id_user)
    return user.has_role? :admin
  end
end