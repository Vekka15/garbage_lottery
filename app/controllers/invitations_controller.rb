class InvitationsController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @invitations = Invitation.all
      @user = User.all
    end
  end

  def new
    # zabezpieczenie przez dostepem do formularza przez link bezposredni
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @new_invitation = Invitation.new
    end
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
