class SessionsController < ApplicationController
  skip_before_action :authenticate!
  skip_after_action :verify_authorized

  def new
    @token = params[:token]
  end

  def create
    auth = request.env['omniauth.auth']
    params = request.env['omniauth.params']

    @identity_service = IdentityService.find_with_omniauth(auth)

    if @identity_service.nil?
      @identity_service = IdentityService.create_with_omniauth(auth)
    end

    if params['invite_token']
      invitation = Invitation.find_by(token: params['invite_token'])
      @identity_service.user.events.push invitation.event
      @identity_service.user.add_role :member, invitation.event
      invitation.destroy
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
    byebug
    redirect_to request.env['omniauth.origin'] || root_path
  end

  def destroy
    self.current_user = nil
    redirect_to root_path, notice: 'Signed out!'
  end
end
