class EventsController < ApplicationController
  

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "New event saved!"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Event did not save. Please try again"
      render :new
    end
  end

  def update
    @event.update_attributes(event_params)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees.all
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to root_path
  end

  def index
    @past = Event.past
    @upcoming = Event.upcoming
  end

  def join_event
    @event = Event.find(params[:id])
    @event.attendances.create!(attendee_id: current_user.id)
    redirect_to event_path(@event)
  end

  private

    def event_params
      params.require(:event).permit(:title, :body, :date, :attendee_id)
    end
end
