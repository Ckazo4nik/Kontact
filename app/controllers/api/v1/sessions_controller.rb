class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]
  def create
    user = User.from_omniauth(params[:oauth_token])
    if user
      session[:user_id] = user.id
      json_response(user)
    else
      json_response(user.errors)
    end
  end


  def destroy
    session[:user_id] = nil
    session[:order_id] = nil
    head :no_content
  end
end
