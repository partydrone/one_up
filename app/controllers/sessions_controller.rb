class SessionsController < ApplicationController
  skip_before_action :authenticate!
  skip_after_action :verify_authorized

  def create
    auth = request.env['omniauth.auth']
    p auth
    @identity_service = IdentityService.find_with_omniauth(auth)

    if @identity_service.nil?
      @identity_service = IdentityService.create_with_omniauth(auth)
    end

    if signed_in?
      if @identity_service.user == current_user
        redirect_to root_path, notice: 'Already linked that account!'
      else
        @identity_service.user = current_user
        @identity_service.save
        redirect_to root_path, notice: 'Successfully linked that account!'
      end
    else
      if @identity_service.user.present?
        self.current_user = @identity_service.user
        redirect_to root_path, notice: 'Signed in!'
      else
        redirect_to new_user_path, notice: 'Please finish registering.'
      end
    end
  end

  def callback
    redirect_to request.env['omniauth.origin'] || root_path
  end

  def destroy
    self.current_user = nil
    redirect_to root_path, notice: 'Signed out!'
  end
end
