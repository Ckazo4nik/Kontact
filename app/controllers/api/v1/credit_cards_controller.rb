class Api::V1::CreditCardsController < ApplicationController
  before_action :find_card, only: [:update, :destroy, :show]

  def all_user_credit_cart
    cards = CreditCard.where(user_id: @user.id)
    render json: cards
  end
  def show
    render json: @card
  end
  def create
    @card = CreditCard.create(card_params.merge(user_id: @user.id))
    render json: @card
  end
  def update
    @card.update(card_params)
    render json: @card
  end
  def destroy
    @card.destroy
    head :no_content
  end
  private

  def card_params
    params.permit(:card_number, :card_date_month, :card_date_year, :user_id)
  end

  def find_card
    @card = CreditCard.find(params[:id])
  end
end
