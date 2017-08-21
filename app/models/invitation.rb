class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User', optional: true

  has_secure_token

  before_save :check_for_existing_user

  private

  def check_for_existing_user
    recipient = User.find_by(email: email)
    if recipient
      self.recipient = recipient
    end
  end
end
