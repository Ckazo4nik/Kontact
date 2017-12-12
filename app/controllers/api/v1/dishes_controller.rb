class Api::V1::DishesController < ApplicationController
  before_action :set_restaurant
  before_action :set_restaurant_dish, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :destroy]

  # GET /restaurants/:restaurant_id/dishes
  def index
    @dishes = @restaurant.dishes
    json_response(@dishes)
    @order_item = current_order.order_items.new
  end

  # GET /restaurants/:restaurant_id/dishes/:id
  def show
    json_response(@dish)
  end

  # POST /restaurants/:restaurant_id/dishes
  def create
    @dish = @restaurant.dishes.create!(dish_params)
    if @restaurant.save
      json_response(@dish, :created)
    else
      json_response(@dish.errors)
    end
  end

  # PUT /restaurants/:restaurant_id/dishes/:id
  def update
    @dish.update(dish_params)
    head :no_content
  end

  # DELETE /restaurants/:restaurant_id/dishes/:id
  def destroy
    @dish.destroy
    head :no_content
  end

  private
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @user = User.find_by(token: token)
    end
  end

  def dish_params
    params.permit(:name, :description, :restaurant_id, :price, :image, :cooking_time)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_restaurant_dish
    @dish = @restaurant.dishes.find_by!(id: params[:id]) if @restaurant
  end
end
