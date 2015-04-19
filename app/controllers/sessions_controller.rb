class SessionsController < ApplicationController
	before_action :redirect_if_connected, except: :destroy

	def new
	end

	def create
		@user = User.where("lower(name) = ?", params[:session][:name].strip.downcase).first
		if @user && @user.authenticate(params[:session][:password])
			sign_in(@user, permanent: params[:session][:remember_me] == "1")
			redirect_back_or profile_path, success: t('snapuser.session.success')
		else
			flash.now[:error] = t('snapuser.session.error')
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path, success: t('snapuser.session.destroy.success')
	end

	private

	def redirect_if_connected
		redirect_to Snapuser.redirect_url unless current_user.nil?
	end

end
