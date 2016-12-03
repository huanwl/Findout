class OptionsController < ApplicationController
  def index
    @level = Level.find(params[:id])
    @options = @level.options
  end

  def new
    @level = Level.find(params[:id])
    @option = Option.new
  end

  def create
    @option = Option.new(params.require(:option)
                             .permit(:name, :image_path, :is_answer, :level_id))

    image = params[:option][:image_path]
    if image != nil
      filename = image.original_filename
      filepath = "#{Rails.root}/public/upload/#{filename}"
      File.open("#{filepath}", "wb") do |f|
         f.write(image.read)
      end
      @option.image_path = "/upload/#{filename}"
    end

    if @option.save
      redirect_to action: "index", id: @option.level_id
    else
      render :new
    end
  end

  def destroy
    @option = Option.find params[:id]

    if @option.image_path != nil and @option.image_path != ""
      filepath = "#{Rails.root}/public" + @option.image_path
      File.delete(filepath)
    end

    @option.destroy
    redirect_to action: "index", id: @option.level_id
  end
end
