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
