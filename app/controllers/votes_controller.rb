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

      #check if vote total has been reached (via method on prompt?)
      current_prompt = Prompt.current
      if current_prompt.vote_total_reached?
        top_vote_getter = current_prompt.votes.group(:response).count.max_by { |response, vote_count| vote_count}[0].user
        #above line likely breaks ties according to whichever user is first in the array returned by ActiveRecord
        #in a more refined product the tiebreaker would be more well thought out

        top_vote_getter.crown
      end

      redirect_to root_path
    end
  end

  private

    def vote_params
      params.require(:vote).permit(:response_id)
    end

end
