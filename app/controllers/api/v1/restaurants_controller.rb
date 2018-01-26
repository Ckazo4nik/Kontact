class Api::V1::RestaurantsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_restaurant, only: [:show, :update, :destroy]

  # GET /restaurants
  def index
    # @restaurants = Restaurant.search "#{(params[:letters])}"
    @restaurants = Restaurant.all unless params[:letters]
    @restaurants = Restaurant.simple_search(params[:letters], :pattern => :beginning) if params[:letters]


    json_response(@restaurants)
  end

  # POST /restaurants
  def create
    @restaurant = @user.restaurants.create(restaurant_params)
    if @restaurant.save
      json_response(@restaurant, :created)
    else
      json_response(@restaurant.errors)
    end
  end

  # GET /restaurants/:id
  def show
    json_response(@restaurant)
  end

  # PUT /restaurants/:id
  def update
    @restaurant.update(restaurant_params)
    json_response(@restaurant)
  end

  # DELETE /restaurants/:id
  def destroy
    @restaurant.destroy
    head :no_content
  end

  private

  def restaurant_params
    # whitelist params
    params.permit(:name, :description, :image, :user_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
