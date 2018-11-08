class SuppliesController < ApplicationController

  def index
    # @supplies = Supply.all

    # @supplies = Supply.order(:name).page(params[:page])
    @med = params[:search]
    @pharmacies = []
    if @med
      @url = "https://www.wellrx.com/prescriptions/#{@med}/?address=29305"
      session = Capybara.current_session
      session.visit @url


      session.all('.tabs-content .row').each do |row|
        pharmacy = {}
        pharmacy[:name] = row.all('.columns').first.text
        pharmacy[:price] = row.find('.pricesm').text
        @pharmacies << pharmacy

        #Discount.create price: @price, pharmacy: @pharmacy_name
      end
    end
    # @zipcode = User.zipcode Need to add user zip to db

  end

  def show

    @supply = Supply.find(params[:id])

    # @discounts = discount.find(params [:price] [:pharmacy])
    session = Capybara::Session.new(:selenium)
    session.visit @url
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
