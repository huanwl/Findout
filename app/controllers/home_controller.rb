class HomeController < ApplicationController
  def index
    @levels = Level.all
  end
  def new

  end
end
