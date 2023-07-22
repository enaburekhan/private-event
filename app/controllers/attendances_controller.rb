class AttendancesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @event = Event.find(params[:id])
    current_user.attendances.create(attended_event: @event)
    redirect_to @event, notice: 'You are now attending this event.'
  end  
  
  def destroy
    @event = Event.find(params[:id])
    current_user.attendances.find_by(attended_event: @event).destroy
    redirect_to @event, notice: 'You are no longer attending this event.'
  end
end
