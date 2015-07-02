class VacancyPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    index?
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
