class SuppliesController < ApplicationController
  def index
    @supplies = Supply.all
    # @supplies = Supply.search (params[:search])
  end

  def show
    @supplies = Supply.find(params[:name] [:price] [:upc])
  end

  def new
    @supplies = Supply.new
  end
end
