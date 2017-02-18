class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to user_path(current_user[:id])
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendanceship = Attendanceship.new
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :time, :location)
    end
end
