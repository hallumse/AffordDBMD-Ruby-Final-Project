class SupplyController < ApplicationController
  def index
    @supplies = Supply.all
  end

  def show
    @supplies = Supply.find(params[:name] [:price] [:upc])
  end

  def new

  end
end
