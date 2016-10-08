class ResponsesController < ApplicationController

  def create
    new_response = Response.new(response_params)
    new_response.user_id = session[:user_id]

    new_response.save
    
    redirect_to root_path
  end

  private

    def response_params
      params.require(:response).permit(:content, :prompt_id)
    end

end
