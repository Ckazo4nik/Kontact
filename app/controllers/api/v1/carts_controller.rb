class Api::V1::CartsController < ApplicationController
  def show
    json_response(@order_items = current_order.order_items)
  end
end
