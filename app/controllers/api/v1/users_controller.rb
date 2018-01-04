class Api::V1::UsersController < ApplicationController

  def index
    @users = User.search "#{(params[:letters])}"

    render json: @users
  end
  def profile
    user = User.find(current_user.id)

    render json: user
  end
end