class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if !Invitation.where(email: @new_user.email).empty?
      @new_user.invited = true
      Invitation.where(email: @new_user.email).first.delete
    end
    if @new_user.save
      redirect_to root_path
    else
      if params[:user][:admin_add].to_s=="true"
        render 'users/new'
      else
        render 'devise/registrations/new'
      end
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
