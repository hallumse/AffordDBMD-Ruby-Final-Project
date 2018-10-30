class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @events = Event.find(params[:location] [:time])
  end

  def create
    @events = Event.find(params[:location] [:time])
    if @events
      redirect_to events_path
    else
      render action: 'event link'
  end

  def edit
    @events = Resource.find(params[:location] [:time])
    @subjects = Subject.all
   end

  def update
   @events = Resource.find(params[:title] [:url] [:category])

   if @events.update_attributes(resources_param)
      redirect_to :action => 'show', :link => @events
   else
      @subjects = Subject.all
      render :action => 'edit'
  end

# private

#   def event_params
#     params.require(:event).permit(:location, :time)
#   end
end
