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
    level_id = params[:level_id]
    no = params[:no]
    selects = params[:options]
    options = Option.where(level_id: level_id)

    is_pass = true
    if selects == nil
      is_pass = false
    else
      options.each do |option|
        if option.is_answer and selects.exclude? option.id.to_s
          is_pass = false
        elsif !option.is_answer and selects.include? option.id.to_s
          is_pass = false
        end
      end
    end

    redirect_to action: "result", level_id: level_id, no: no, is_pass: is_pass
  end

  def result
    level_id = params[:level_id]
    @level = Level.find(level_id)
    @no = params[:no]
    @is_pass = params[:is_pass]
  end

end
