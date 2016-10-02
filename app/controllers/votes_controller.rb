class VotesController < ApplicationController

  def create
    vote = Vote.create(vote_params)
    vote.user = current_user
    vote.save
    # Vote.create(response_id: params[:response_id], user_id: current_user.id)
    redirect_to root_path
  end


  private

  def vote_params
    params.require(:vote).permit(:response_id)
  end

end
