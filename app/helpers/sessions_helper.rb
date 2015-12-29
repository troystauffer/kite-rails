module SessionsHelper
  def log_in(user)
    session[:token] = user["token"]
  end

  def is_logged_in
    session[:token] ? true : false
  end
end