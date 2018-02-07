class Api::V1::CreditCartsController < ApplicationController
  before_action :find_cart, only: [:update, :destroy, :show]

  def all_user_credit_cart
    carts = CreditCart.where(user_id: @user.id)
    render json: carts
  end
  def show
    render json: @cart
  end
  def create
    @cart = CreditCart.create(cart_params.merge(user_id: @user.id))
    render json: @cart
  end
  def update
    @cart.update(cart_params)
    render json: @cart
  end
  def destroy
    @cart.destroy
    head :no_content
  end
  private

  def cart_params
    params.permit(:cart_number, :cart_date, :user_id)
  end

  def find_cart
    @cart = CreditCart.find(params[:id])
  end
end
