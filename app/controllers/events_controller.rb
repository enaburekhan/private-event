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

  # def attend
  #   @event = Event.find(params[:id])

  #   if @event.attendees.include?(current_user)
  #     redirect_to events_path, notice: "You are already on the list"  
  #   else
  #     @event.attendees << current_user
  #     redirect_to events_path, notice: 'Ooops! Something went wrong...'
  #   end
  # end

  # def unattend
  #   @event = Event.find(params[:id])
  #   @event.attendees(current_user).destroy
  #   redirect_to event_path(@event), notice: 'You are no longer attending this event.'
  # end
  
  private 

    def event_params
      params.require(:event).permit(:name, :date, :location, :creator_id)
    end
end
