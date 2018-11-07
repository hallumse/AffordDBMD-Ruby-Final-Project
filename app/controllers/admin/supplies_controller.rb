class Admin::SuppliesController < ApplicationController
  before_action :authenticate_user!
  def index
    # @supplies = Supply.all
    # @supplies = Supply.search (params[:search])
    @supplies = Supply.order(:name).page(params[:page])
  end

  def new
    @supply = Supply.new
  end

  def show
    @supply = Supply.find(params[:name] [:price] [:upc])
  end

  def update
   @supply = Supply.find(params[:id])
   @supply.update(supply_params)
   redirect_to supply_path(@supply)
  end

  def create
    supply = Supply.new(supply_params)
    if supply.save
      redirect_to supplies_path
    else
      render :new
    end
  end

  def edit
    @supply = Supply.find(params[:id])
  end

  def destroy
   Supply.find(params[:name] [:price] [:upc]).destroy
   redirect_to supplies_path
  end

private
  def supply_params
    params.require(:supply).permit(:name, :upc)
  end
end
