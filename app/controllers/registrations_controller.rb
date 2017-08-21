class RegistrationsController < ApplicationController
  before_action :set_event, only: [:index]
  before_action :set_registration, only: [:edit, :update, :destroy]

  def index
    @registrations = @event.registrations.includes(:user).order('users.name')
  end

  def edit
  end

  def update
    if @registration.update_attributes(registration_params)
      redirect_to @registration.event, notice: %(Registration updated.)
    else
      render :edit
    end
  end

  def destroy
    @registration.destroy
    redirect_to events_path, notice: %(You left the event successfully.)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def set_registration
    @registration = Registration.find(params[:id])
    authorize @registration
  end

  def registration_params
    params.require(:registration).permit(:extra_life_participant_id, SYSTEMS.keys)
  end
end
