class ActivityPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user.has_role? :owner, record.event
  end

  def join?
    true
  end

  def leave?
    record.participants.include? user
  end
end
