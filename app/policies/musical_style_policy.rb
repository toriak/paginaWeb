class MusicalStylePolicy < ApplicationPolicy

  def index?
    true
  end
  def new?
    create?
  end
  def create?
    user.present? && (user.has_role? :admin)
  end
end