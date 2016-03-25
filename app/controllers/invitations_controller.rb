class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end

  def new
    @new_invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      InvitationMailer.send_invitation(@invitation).deliver_now
      redirect_to root_path
    else
      render 'new'
    end
  end

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
