class InvitationMailer < ApplicationMailer

  def send_invitation(invitation)
    @inv = invitation
    mail(to: invitation.email, subject: "Test")
  end
end
