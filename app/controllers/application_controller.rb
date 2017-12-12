class ApplicationController < ActionController::Base
  include ActionController::Helpers
  include Response
  include ExceptionHandler
  helper_method :current_user
  helper_method :current_order

  def current_user
    @current_user ||= User.find_by(oauth_token: session[:user_id]) if session[:user_id]
  end



  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
