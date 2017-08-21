class RegistrationPolicy < ApplicationPolicy
  def update?
    record.user = user
  end

  def destroy?
    record.user = user || user.has_role?(:owner, record.event)
  end
end
