class Admin::SupplyController < ApplicationController
  def index
    @supplies = Supply.all
  end

  def show
    @supplies = Supply.find(params[:name] [:price] [:upc])
  end

  def update
   @supplies = Supply.find(params[:name] [:price] [:upc])
   @supplies.name = params[:price][:upc]
   @supplies.save
   redirect_to supplies_path(@supplies)
  end

  def create
    Supply.create(name: params[:price][:upc])
    redirect_to supplies_path
  end

  def edit
    @suppplies = Supply.find(params[:name] [:price] [:upc])
  end

  def destroy
   Supply.find(params[:name] [:price] [:upc]).destroy
   redirect_to supplies_path
  end
end
