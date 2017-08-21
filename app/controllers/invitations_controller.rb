class InvitationsController < ApplicationController
  before_action :set_event, except: [:destroy]
  before_action :set_invitation, only: [:destroy]

  def index
    @invitations = @event.invitations
  end

  def new
    @invitation = @event.invitations.new
  end

  def create
    @invitation = @event.invitations.new(invitation_params)
    @invitation.sender = current_user
    if @invitation.save
      InvitationMailer.user_invitation(@invitation).deliver
      redirect_to event_invitations_path(@event), notice: %(Invitation sent!)
    else
      render :new
    end
  end

  def destroy
    @invitation.destroy
    redirect_back fallback_location: events_path, notice: %(Invitation revoked!)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
    authorize @invitation
  end

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
