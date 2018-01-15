class Api::V1::UsersController < ApplicationController

  def index
    @users = User.search "#{(params[:letters])}"

    render json: @users
  end
  def profile

    render json: @user
  end
  def update
    @user.update(user_params)
    json_response(user)
  end

  private

  def user_params
      params.permit(:name, :email, :image, :phone)
  end
end