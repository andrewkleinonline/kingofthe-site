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
    @prompt = Prompt.current
    render :show
  end

  def new
    if current_user.king
      @king = current_user
      @prompt = Prompt.new
    else
      redirect_to root_path
    end
  end

  def create
    new_prompt = Prompt.new(prompt_params)
    new_prompt.king = User.current_king
    new_prompt.save
    new_prompt.make_current

    redirect_to root_path
  end

  private

    def prompt_params
      params.require(:prompt).permit(:content)
    end

end
