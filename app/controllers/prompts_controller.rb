class PromptsController < ApplicationController

  def index
    @prompts = Prompt.all
    @vote = Vote.new
  end

  def show
    @prompt = Prompt.find(params[:id])
    @vote = Vote.new
  end

  def show_current
    @prompt = Prompt.find_by(current: true)
    @vote = Vote.new
    render :show
  end

end
