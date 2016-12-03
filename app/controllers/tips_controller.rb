class TipsController < ApplicationController
  def index
    @level = Level.find(params[:id])
    @tips = @level.tips
  end

  def new
    @level = Level.find(params[:id])
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(params.require(:tip)
                         .permit(:name, :level_id))

    if @tip.save
      redirect_to action: "index", id: @tip.level_id
    else
      render :new
    end
  end

  def destroy
    @tip = Tip.find params[:id]
    @tip.destroy
    redirect_to action: "index", id: @tip.level_id
  end
end
