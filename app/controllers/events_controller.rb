class EventsController < ApplicationController
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
  end
end
