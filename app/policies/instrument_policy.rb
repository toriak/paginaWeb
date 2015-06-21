class InstrumentPolicy < ApplicationPolicy
	def index?
    true
  end

  def create?
    user.present?
  end

  def new?
    user.present?
  end
end