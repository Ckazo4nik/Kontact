class Api::V1::OrdersController < ApplicationController
  before_action :find_order, only: [:show, :destroy]
  def index
    # @orders = Order.where(restaurant_id: current_user.restaurants.first.id).search (params[:letters])
    @orders = Order.search(params[:number])
    @d = @orders.select { |a| a.restaurant_id == current_user.restaurants.first.id}


    render json: @d
  end

  def my_orders
    @orders = Order.search(params[:number])

    @d = @orders.select { |a| a.user_id == current_user.id}

    render json: @d
  end

  def show
    render json: @order
  end

  def destroy
    @order.destroy

    head :no_content
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
end
