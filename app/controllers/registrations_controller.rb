class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:edit, :update]

  def edit
  end

  def update
    if @registration.update_attributes(registration_params)
      redirect_to @registration.event, notice: %(Updated registration successfully.)
    else
      render :edit
    end
  end

  private

  def set_registration
    @registration = Registration.find(params[:id])
    authorize @registration
  end

  def registration_params
    params.require(:registration).permit(:extra_life_participant_id, SYSTEMS.keys)
  end
end
