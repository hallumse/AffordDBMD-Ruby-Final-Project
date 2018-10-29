class UsersController < ApplicationController
  before_action :authenticate_user!
  def new
    @url = params[.url]
    User.notify_about_discount(url)
  end
end
