class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.user_invitation.subject
  #
  def user_invitation(invitation)
    @invitation = invitation

    mail to: @invitation.email
  end
end
