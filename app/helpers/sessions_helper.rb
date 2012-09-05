module SessionsHelper
	def login(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def logged_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
    user == current_user
  end

  def logged_in_user
  	unless logged_in?
  		store_location
  		redirect_to login_url, notice: "Please log in first."
  	end
  end

  def redirect_back_or(default)
  	redirect_to(session[:return_to] || default)
  	session.delete(:return_to)
  end

  def store_location
  	session[:return_to] = request.url
  end

	def logout
		self.current_user = nil
		cookies.delete(:remember_token)
	end
end
