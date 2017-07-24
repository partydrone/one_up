class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    p auth
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      @identity = Identity.create_with_omniauth(auth)
    end

    if signed_in?
      if @identity.user == current_user
        redirect_to root_path, notice: 'Already linked that account!'
      else
        @identity.user = current_user
        @identity.save
        redirect_to root_path, notice: 'Successfully linked that account!'
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
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
