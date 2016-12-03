class HomeController < ApplicationController
  def index
    @levels = Level.all
  end

  def new
    @no = params[:no]
    @level = Level.find(params[:id])
    @options = @level.options
  end

  def create
    redirect_to action: "index"
  end
end
