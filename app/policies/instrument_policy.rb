class InstrumentPolicy < ApplicationPolicy
	def index?
    true
  end

  def create?
    user.present? && (user.has_role? :admin)
  end

  def new?
    create?
  end
end