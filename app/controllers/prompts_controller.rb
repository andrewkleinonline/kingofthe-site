class PromptsController < ApplicationController

  def index
    @prompts = Prompt.all
  end

  def show
    @prompt = Prompt.find(params[:id])
  end

  def show_current
    @prompt = Prompt.find_by(current: true)
    render :show
  end

end
