class InvitationMailer < ApplicationMailer

  def send_invitation(invitation)
    mail(to: invitation.email, subject: "Test")
  end
end
