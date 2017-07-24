class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token])
  end

  def signed_in?
    !!current_user
  end
  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    cookies[:auth_token] = user.nil? ? nil : user.auth_token
  end
end
