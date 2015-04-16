class Admin::UsersController < ApplicationController
	before_action { |c| c.authorize_level(Snapuser.superuser_level) }
	layout 'admin'

	def index
		@table = Table.new(self, User)
		@table.respond
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to admin_users_path, success: t('snapuser.admin.new.success')
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to admin_users_path, success: t('snapuser.admin.edit.success')
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to admin_activities_path, success: t('snapuser.admin.destroy.success')
	end

	private

	def user_params
		params.require(:user).permit(:name, :level, :password, :password_confirmation)
	end
end
