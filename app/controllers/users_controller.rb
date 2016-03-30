class UsersController < ApplicationController


  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      if current_user.admin?
        @all_users = User.all
      else
        redirect_to root_path
      end
    end
  end

  def new
    if current_user.nil?
      redirect_to root_path
    else
      if current_user.admin?
        @new_user = User.new
      else
        redirect_to root_path
      end
    end
  end

  def add
    if current_user.admin==true
      @new_user = User.new(user_params)
      if !Invitation.where(email: @new_user.email).empty?
        @new_user.invited = true
        Invitation.where(email: @new_user.email).first.delete
        params[:invitation_id]=@new_user.email
      end
      if @new_user.save
        InvitationMailer.send_notification_add(@new_user).deliver_now
        redirect_to users_path
      else
        render 'users/new'
      end
    else
      redirect_to root_path
    end
  end

  def delete
    if current_user.admin==true
      user = User.find(params[:id])
      all_users = User.where.not(email: user.email)
      all_invitations = Invitation.all
      all_assignations = Assignation.all
      all_members = all_users.size + all_invitations.size

      all_assignations.each do |a|
        if a.user_mail == user.email
          chosen = rand(0..all_members - 1)
          if chosen < all_users.size
            a.update_attributes(user_mail: all_users[chosen].email)
          else
            invitation_number = all_members - chosen - 1
            a.update_attributes(user_mail: all_invitations[invitation_number].email)
          end
          a.save
        end
      end
       if user.destroy
         InvitationMailer.send_notification_delete(user).deliver_now
         redirect_to users_path
       else
         redirect_to root_path
       end
     else
       redirect_to root_path
     end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end



end
