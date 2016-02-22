module SessionsHelper

  def sign_in(user)
    # cookies.permanent[:remember_token] = user.remember_token
    # self.current_user = user
    session[:user_id] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  # def current_user= (user)
  #   @current_user = user
  # end

  def current_user
    # @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # def current_user?(user)  # used in Users controller
  #   user == current_user
  # end

  # def sign_out
    # self.current_user = nil
    # cookies.delete(:remember_token)

  #   session.delete(:user_id)
  #   @current_user = nil
  # end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath
  end

end
