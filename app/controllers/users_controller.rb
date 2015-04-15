class UsersController < ApplicationController
  before_action except: [:profile] { |c| c.authorize_level(2) }
  before_action only: [:profile] { |c| c.authorize_level(4) }
  layout 'admin'

  def profile
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      sign_in @user
      redirect_to profile_path, success: t('user.edit.success')
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end