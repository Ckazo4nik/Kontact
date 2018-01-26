class Api::V1::DishesController < ApplicationController
  before_action :set_restaurant, except: :index
  before_action :set_restaurant_dish, only: [:show, :update, :destroy]

  # GET /restaurants/:restaurant_id/dishes
  def index
    # @dishes = Dish.search "#{params[:letters]}"
     @dishes = Dish.all unless params[:letters]
    @dishes = Dish.simple_search(params[:letters], :pattern => :beginning) if params[:letters]

    @d = @dishes.select { |a| a.restaurant_id == (params[:restaurant_id]).to_i}


    json_response(@d)
  end
  # @order_item = current_order.order_items.create
  # GET /restaurants/:restaurant_id/dishes/:id
  def show
    json_response(@dish)
  end

  # POST /restaurants/:restaurant_id/dishes
  def create
    @dish = @restaurant.dishes.create!(dish_params.merge(restaurant_id: @restaurant.id))
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

  def dish_params
    params.permit(:name, :description, :restaurant_id, :price, :image,:show, :cooking_time)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_restaurant_dish
    @dish = @restaurant.dishes.find_by!(id: params[:id]) if @restaurant
  end
end
