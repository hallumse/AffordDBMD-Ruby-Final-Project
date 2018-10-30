class UserController < ApplicationController
  before_action :authenticate_user!
  def new
    @url = params[.url]
    User.notify_about_discount(url)
  end

  def change
    # Need a change method?
  end

  def index
    # PurchaseMailer.with(user: User.first).thank_you.deliver_later

    # @current_page = params[:page] || 1

    @users = User.page(@current_page)
    @prev_page = User.page(@current_page).prev_page
    @next_page = User.page(@current_page).next_page
  end

  def styleguide
    # Need a styleguide method?
  end
end
