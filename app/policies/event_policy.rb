class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    user.has_role? :admin, record
  end

  class Scope < Scope
    def resolve
      user.events
    end
  end
end
