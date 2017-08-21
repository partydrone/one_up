class InvitationPolicy < ApplicationPolicy
  def destroy?
    user == record.sender || user.has_role?(:owner, record.event)
  end
end
