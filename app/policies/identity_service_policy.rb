class IdentityServicePolicy < ApplicationPolicy
  def destroy?
    record.user == user
  end
end
