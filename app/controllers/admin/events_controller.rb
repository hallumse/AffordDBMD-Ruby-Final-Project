class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.all
  end

  def new
    @events = Event.new
  end

  def show
    @events = Event.find(params[:location] [:time])
  end

  def update
   @events = Event.find(params[:location] [:time])
   @events.save
   redirect_to events_path(@events)
  end

  def create
    Event.create(event: params[:location][:time])
    redirect_to events_path
  end

  def edit
    @events = Event.find(params[:location] [:time])
  end

  def destroy
   Event.find(params[:location] [:time]).destroy
   redirect_to events_path
  end
end
