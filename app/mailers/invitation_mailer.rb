class InvitationMailer < ApplicationMailer

  def send_invitation(invitation)
    @inv = invitation
    mail(to: invitation.email, subject: "GARBAGE_LOTTERY Invitation")
  end

  def send_notification_add(user)
    @user = user
    mail(to: user.email, subject: "GARBAGE_LOTTERY Welcome")
  end

  def send_notification_delete(user)
    @user = user
    mail(to: user.email, subject: "GARBAGE_LOTTERY Bye bye")
  end
end
