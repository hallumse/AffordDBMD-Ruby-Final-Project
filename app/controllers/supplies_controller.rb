class SuppliesController < ApplicationController

  def index
    if params[:search]
      # do search stuff here
      @supplies = Supply.search_by_name_and_brand(params[:search])
    else
      @supplies = Supply.order(:name).page(params[:page])
    end
  end

  def new
    @supplies = Supply.new
  end
end
