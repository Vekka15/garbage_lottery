class Users::RegistrationsController < Devise::RegistrationsController

before_action :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    if !Invitation.where(email: @user.email).empty?
      @user.invited = true
    end
    if @user.save
      if !Invitation.where(email: @user.email).empty?
        Invitation.where(email: @user.email).first.delete
      end
      sign_in @user
      redirect_to root_path
    else
      params[:user][:invited]=true
      render 'devise/registrations/new', user: {invited: true}
    end
  end


  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
