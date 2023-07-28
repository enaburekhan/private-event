class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.created_events.build(event_params)

    if @event.save
      redirect_to events_url, notice: 'Event was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end 

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Event successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])

    # Delete all associated attendances
    # @event.attendances.destroy_all
    @event.destroy

    redirect_to events_path, notice: 'Event successfully deleted'
  end
  
  private 

    def event_params
      params.require(:event).permit(:name, :date, :location, :creator_id)
    end
end
