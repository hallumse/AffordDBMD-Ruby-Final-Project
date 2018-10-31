class HomeController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  # def new
  #   @home = Home.new
  # end

  def styleguide

  end
end
