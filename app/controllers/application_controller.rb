class ApplicationController < ActionController::Base
  include ActionController::Helpers
  include Response
  include ExceptionHandler
  helper_method :current_user
  helper_method :current_order
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::Serialization
  before_action :authenticate

  private

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      user = User.find_by(token: token)
      user
    end
  end

  def render_unauthorized
    error = { error: { code: 401, message: 'Authorization required' } }
    render json: error, status: 401
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
