class RegistrationPolicy < ApplicationPolicy
  def update?
    record.user = user
  end
end
