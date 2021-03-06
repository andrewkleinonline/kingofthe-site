class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    User.find_or_create_from_omniauth(auth)
    user = User.find_by(facebook_user_id: auth[:uid])

    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
