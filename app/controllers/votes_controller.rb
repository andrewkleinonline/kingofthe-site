class VotesController < ApplicationController

  def create
    vote = Vote.create(vote_params)
    vote.user = current_user
    vote.save
    redirect_to root_path
  end

  # def destroy
  # end


  private

  def vote_params
    params.require(:vote).permit(:response_id)
  end

end
