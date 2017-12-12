class Api::V1::SessionsController < ApplicationController
  def create
    user = User.from_omniauth(params[:oauth_token])
    session[:user_id] = user.id
    redirect_to root_path
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
