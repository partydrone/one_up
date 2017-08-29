class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    user.has_role? :owner, record
  end

  def join?
    true
  end

  def leave?
    record.members.include?
  end

  class Scope < Scope
    def resolve
      user.events
    end
  end
end
