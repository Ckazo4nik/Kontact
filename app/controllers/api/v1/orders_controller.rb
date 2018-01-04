class Api::V1::OrdersController < ApplicationController
  before_action :find_order, except: :index
  def index
    # @orders = Order.where(restaurant_id: current_user.restaurants.first.id).search (params[:letters])
    @orders = Order.search(params[:number])
    @d = @orders.select { |a| a.restaurant_id == current_user.restaurants.first.id}


    render json: @d
  end

  def show
    render json: @order
  end

  def destroy
    @order.destroy

    render status: 200, json: 1
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
end
