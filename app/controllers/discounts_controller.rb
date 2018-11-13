require 'capybara'
class DiscountsController < ApplicationController
  def index
    @supply = Supply.find(params[:supply_id])
    @discounts = @supply.discounts
  end

  def show
    @discount = Discount.find(params[:id])
    # binding.pry

    # @discounts = discount.find(params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy])
    # @med = wellrx
    # session = Capybara::Session.new(:selenium)
    # session.visit 'https://www.wellrx.com/prescriptions/acarbose/?address=29305'
    # session.all('.tabs-content .row').each do |row|
    #   name = row.all('.columns').first.text
    #   price = row.find('.pricesm').text

    #   Discount.create price: price, pharmacy: name
  end

  # def update
  #  @discounts = Discount.find(params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy])
  #  @discounts.save
  #  # Would it be redirecting to discounts or supplies path, since it would be discounts on supplies?
  #  redirect_to discounts_path(@discounts)
  # end

  # def create
  #   Discount.create(discount: params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy])
  #   redirect_to discounts_path
  # end

  # def edit
  #   @discounts = Discount.find(params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy])
  # end

  # def destroy
  #  Discount.find(params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy]).destroy
  #  redirect_to discounts_path
  # end
end
