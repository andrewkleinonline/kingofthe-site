class VotesController < ApplicationController

  def create
    if current_user.liked_response_ids.include?(vote_params[:response_id].to_i)
      Vote.find_by(response_id: vote_params[:response_id], user_id: session[:user_id]).destroy
      redirect_to root_path
    else
      vote = Vote.create(vote_params)
      vote.user = current_user
      vote.save
      redirect_to root_path # should revise -- this redirects user to current
      # prompt show page even if they voted through the prompt index page.
      # Perhaps voting should not be possible on prompt index page? Or prompt
      # index page should not render the current prompt (so the index page is
      # PAST decrees)
    end
  end

  # def destroy
  # end


  private

  def vote_params
    params.require(:vote).permit(:response_id)
  end

end
