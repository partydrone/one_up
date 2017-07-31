class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate!
  after_action :verify_authorized

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

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

    if user.nil?
      cookies.delete :auth_token
    else
      cookies[:auth_token] = {
        value: user.auth_token,
        expires: 30.days.from_now
      }
    end
  end

  private

  def authenticate!
    redirect_to sign_in_path unless current_user
  end

  def permission_denied
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
