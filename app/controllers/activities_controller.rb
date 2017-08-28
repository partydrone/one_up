class ActivitiesController < ApplicationController
  before_action :set_event, only: [:new, :create]
  before_action :set_activity, only: [:edit, :update, :destroy, :join, :leave]

  def show
    @activity = Activity.includes(:event).find(params[:id])
    authorize @activity
  end

  def new
    @activity = @event.activities.new
  end

  def create
    @activity = @event.activities.new(activity_params)
    if @activity.save
      redirect_to @event, notice: %(Activity created.)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update_attributes(activity_attributes)
      redirect_to @activity.event, notice: %(Activity updated.)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to @activity.event, notice: %(Activity destroyed.)
  end

  def join
    @activity.participants << current_user
    redirect_to @activity, notice: %(You're all signed up!)
  end

  def leave
    @activity.participants.destroy(current_user)
    redirect_to @activity.event, notice: %(You left the activity.)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def set_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def activity_params
    params.require(:activity).permit(:title, :started_at, :ended_at)
  end
end
