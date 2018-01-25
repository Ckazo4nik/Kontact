class Api::V1::OrdersController < ApplicationController
  before_action :find_order, only: [:show, :destroy, :update]
  def index
    # @orders = Order.where(restaurant_id: current_user.restaurants.first.id).search (params[:letters])
    @orders = Order.search(params[:number])
    @d =[]
    @orders.each do |f|
      if f.restaurant_id == @user.restaurants.first.id && f.order_status.id == params[:status].to_i
        @d.push(f)
      end
        @d
    end


    render json: @d
  end

  def my_orders
    @orders = Order.all

    @d = @orders.select { |a| a.user_id == @user.id}

    render json: @d
  end

  def show
    render json: @order
  end

  def destroy
    @order.destroy

    head :no_content
  end

  def update
    @order.update(order_params)

    render json: @order
  end

  private

  def order_params
    params.permit(:order_status_id)
  end
  def find_order
    @order = Order.find(params[:id])
  end
end
