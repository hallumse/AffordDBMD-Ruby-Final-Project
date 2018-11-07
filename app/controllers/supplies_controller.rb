class SuppliesController < ApplicationController
  def index
    # @supplies = Supply.all

    @supplies = Supply.order(:name).page(params[:page])
    @supplies = Supply.search (params[:search])
  end

  def show
    @supply = Supply.find(params[:id])
    end
  end

  def new
    @supplies = Supply.new
  end
end
