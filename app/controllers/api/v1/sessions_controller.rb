class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]
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
    session[:order_id] = nil
    render status: 200, json: 1
  end
end
