class Api::V1::SessionsController < ApplicationController
  def create
    user = User.from_omniauth(params[:oauth_token])
    if user.save
      json_response(user)
      session[:user_id] = user.id
    else
      json_response(user.errors)
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
