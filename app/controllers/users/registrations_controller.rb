class Users::RegistrationsController < Devise::RegistrationsController

  def profile_edit
  end

  def profile_update
    # binding.pry
    current_user.assign_attributes(account_update_params)
    if current_user.save
    redirect_to "/users/current_user.id", notice: 'PROFILE EDIT COMPLETE'
    else
      render "profile_edit"
    end
  end

  protected

  def configure_account_update_params
   # devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :text, :email])
   params.require(:user).permit(:text, :email, :nickname)
  end
end


