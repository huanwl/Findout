class LevelsController < ApplicationController
  def index
    @levels = Level.all
  end

  def show
  end

  def new
    @level = Level.new
  end

  def edit
  end

  def create
    @level = Level.new(params.require(:level)
                             .permit(:name, :description, :image_path))

    image = params[:level][:image_path]
    if image != nil
      filename = image.original_filename
      filepath = "#{Rails.root}/public/upload/#{filename}"
      File.open("#{filepath}", "wb") do |f|
    	   f.write(image.read)
      end
      @level.image_path = "/upload/#{filename}"
    end

    if @level.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def destroy
    @level = Level.find params[:id]
    @level.destroy
    redirect_to action: "index"
  end
end
