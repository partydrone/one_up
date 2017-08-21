require "test_helper"

describe InvitationMailer do
  it "user_invitation" do
    mail = Invitation.user_invitation
    value(mail.subject).must_equal "User invitation"
    value(mail.to).must_equal ["to@example.org"]
    value(mail.from).must_equal ["from@example.com"]
    value(mail.body.encoded).must_match "Hi"
  end
end
