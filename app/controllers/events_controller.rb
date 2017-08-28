class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = policy_scope(Event)
    authorize Event
  end

  def show
  end

  def new
    @event = Event.new
    authorize @event
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.users << current_user
    authorize @event

    if @event.save
      current_user.add_role :owner, @event
      redirect_to @event, notice: %(Event created successfully!)
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: %(Event updated successfully!)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: %(Event deleted successfully!)
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:title, :started_at, :ended_at, :location, :description, :extra_life_team_id, :twitch_stream_url)
  end
end
