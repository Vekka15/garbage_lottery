class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
    @user = User.all
  end

  def new
    @new_invitation = Invitation.new
  end

  def create
    @new_invitation = Invitation.new(invitation_params)
    if @new_invitation.save
      InvitationMailer.send_invitation(@new_invitation).deliver_now
      redirect_to root_path
    else
      render 'new'
    end
  end

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
