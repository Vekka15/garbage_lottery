class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def new
    @new_user = User.new
  end

  def create
    @user = User.new(user_params)
    if !Invitation.where(email: @user.email).empty?
      @user.invited = true
      Invitation.where(email: @user.email).first.delete
    end
    if @user.save
      redirect_to root_path
    else
      render 'devise/registrations/new'
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
