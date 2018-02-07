class Api::V1::ChargesController < ApplicationController
  def new
  end

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    Stripe.api_key = "#{restaurant.secret_key_restaurant}"

    @amount = params[:amount]
    customer = Stripe::Customer.create(
        source: params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd'
    )

  rescue Stripe::CardError => e
    render json: flash[:error] = e.message
  end
end
