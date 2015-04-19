class UsersController < ApplicationController
  before_action { |c| c.authorize_level(Snapuser.can_edit) }
  layout Snapuser.layout

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      sign_in @user
      redirect_to profile_path, success: t('snapuser.edit.success')
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end