class PromptsController < ApplicationController

  # def index
  #   @prompts = Prompt.all
  # end

  def past_decrees
    @prompts = Prompt.where(current: false)
    render :index
  end

  def show
    @prompt = Prompt.find(params[:id])
  end

  def show_current
    @prompt = Prompt.find_by(current: true)
    render :show
  end

  def new
    @prompt = Prompt.new
  end

end
