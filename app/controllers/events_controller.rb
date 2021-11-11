class EventsController < ApplicationController
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
    # instantiate a new object using form parameters
    @event = Event.new(event_params)
    # save the object
    if @event.save
      # if save succeeds, redirect to the index action
      redirect_to(events_path)
    else
      # if save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @event = Event.find(params[:id])
   
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to(events_path)
    else
      render('edit')
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to(events_path)
  end

  def delete_all
    Event.delete_all
    flash[:notice] = "You have removed all results!"
    redirect_to(events_path)
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :start_time, :end_time, :description)
  end
end
