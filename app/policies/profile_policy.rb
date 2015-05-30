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

end