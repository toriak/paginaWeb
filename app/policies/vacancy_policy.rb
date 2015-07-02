class VacancyPolicy < ApplicationPolicy

  def index?
    create?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.band.creator == user || (user.has_role? :admin))
  end

  def destroy?
    update?
  end

end
