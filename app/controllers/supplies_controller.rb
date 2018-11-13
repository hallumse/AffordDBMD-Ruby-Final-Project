class SuppliesController < ApplicationController

  def index
    if params[:search]
      # do search stuff here
      @supplies = Supply.search_by_name_and_brand(params[:search])
    else
      @supplies = Supply.order(:name).page(params[:page])
    end
  end

  def show
    # @supply = Supply.find(params[:name] [:price] [:upc])
    @supply = Supply.find(params[:id])

    # @discount = Discount.find(params [:price] [:pharmacy])
    session = Capybara::Session.new(:selenium)
    # session.visit @url
    session.all('.tabs-content .row').each do |row|
      @pharmacy_name = row.all('.columns').first.text
      @price = row.find('.pricesm').text

      Discount.create price: @price, pharmacy: @pharmacy_name
    end
  end

  def new
    @supplies = Supply.new
  end
end
