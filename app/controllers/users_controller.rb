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
    @new_user = User.new(user_params)
    if !Invitation.where(email: @new_user.email).empty?
      @new_user.invited = true
      Invitation.where(email: @new_user.email).first.delete
    end
    if @new_user.save
      redirect_to root_path
    else
      if params[:user][:admin_add].to_s=='true'
        render 'users/new'
      else
        render 'devise/registrations/new'
      end
    end
  end

  def delete
    user = User.find(params[:id])
     if user.destroy
       redirect_to users_path
     else
       redirect_to root_path
     end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
