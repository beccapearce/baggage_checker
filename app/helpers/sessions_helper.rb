module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end
  def signed_in?
    !current_user.nil?
  end
  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_user=(user)
    @current_user = user
  end
  def authenticate
    deny_access unless signed_in?
  end
  def current_user?(user)
    user == current_user
  end
end
