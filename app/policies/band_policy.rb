class BandPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    record.creator == user
  end

  def new?
    user.present?
  end

  def update?
    user.present? && (record.creator == user || (user.has_role? :admin))
  end

  def destroy?
    user.present? && (record.creator == user || (user.has_role? :admin))
  end

end
