class Admin::ResourcesController < ApplicationController
  before_action :authenticate_user!
  def index
    @resources = Resource.all
  end

  def new
    @resources = Resource.new
  end

  def show
    @resources = Resource.find(params[:title] [:url] [:category])
  end

  def update
   @resources = Resource.find(params[:title] [:url] [:category])
   @resources.title = params[:url][:category]
   @resources.save
   redirect_to resources_path(@resources)
  end

  def create
    Resource.create(title: params[:url][:category])
    redirect_to resources_path
  end

  def edit
    @resources = Resource.find(params[:id])
  end

  def destroy
   Resource.find(params[:title] [:url] [:category]).destroy
   redirect_to resouces_path
  end
end
