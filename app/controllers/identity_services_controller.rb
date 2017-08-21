class IdentityServicesController < ApplicationController
  before_action :set_identity_service

  def destroy
    @identity_service.destroy
    redirect_back fallback_location: root_path
  end

  private

  def set_identity_service
    @identity_service = IdentityService.find(params[:id])
    authorize @identity_service
  end
end
