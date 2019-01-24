class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @image = current_user.image
    @text = current_user.text
    @tweet = current_user.tweets.page(params[:page]).per(6).order("created_at DESC")
  end

  # def profile_edit
  # end

  # def profile_update
  #   current_user.assign_attributes(configure_account_update_params)
  #   if current_user.save
  #   redirect_to root_path, notice: 'PROFILE EDIT COMPLETE'
  #   else
  #     render "profile_edit"
  #   end
  # end

  # protected

  # def configure_account_update_params
  #  devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :text, :email])
  # end
end
