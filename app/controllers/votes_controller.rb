class VotesController < ApplicationController

  def create
    response_id = vote_params[:response_id].to_i

    if current_user.already_voted?(response_id)
      #change this to a redirect to destroy?
      Vote.find_by(response_id: response_id, user_id: session[:user_id]).destroy
      redirect_to root_path
    else
      vote = Vote.create(vote_params)
      vote.user = current_user
      vote.save
      redirect_to root_path
    end
  end

  private

    def vote_params
      params.require(:vote).permit(:response_id)
    end

end
