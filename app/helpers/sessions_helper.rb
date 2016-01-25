module SessionsHelper

	# Sign in a user with a cookie (remove on browser close)
	#
	# * *Args*		:
	# 	- a user to sign in
	# * *Returns*	:
	#
	def sign_in(user, permanent: false)
    cookies[:remember_token] = { value: user.remember_token, expires: (Time.now + 2592000 if permanent) }
    self.current_user = user
  end

	def current_user=(user)
		@current_user = user
	end

	# Provid the user currently signed in.
	#
	# * *Returns*	:
	# 	- the user currently signed in
	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end


	# Check if there is a user signed in.
	#
	# * *Returns*	:
	# 	- true or false
	def signed_in?
		!current_user.nil?
	end

	# Sign out a user by removing the cookie.
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	# Store the current url in session's variable
  #
  # * *Args*    :
  #
  # * *Returns* :
  #
  def store_location
    cookies[:return_to] = { value: request.fullpath, expires: 1.minute.from_now }
  end

  # Redirect the user to the stored url or the default one provided
  #
  # * *Args*    :
  #   - default path to redirect to
  # * *Returns* :
  #
  def redirect_back_or(default, message = nil)
    redirect_to(cookies[:return_to] || default, message)
    session.delete(:return_to)
  end

  def authorize_level?(level)
    current_user && current_user.level <= level
  end

  def authorize_level(level)
    unless authorize_level?(level)
      store_location
      redirect_to login_path, error: t("snapuser.errors.unauthorized")
    end
  end

  def require_login
    redirect_to login_path, error: t("snapuser.errors.unconnected") unless signed_in?
  end

end
