class ApplicationController < ActionController::Base
  include ActionController::Helpers
  include Response
  include ExceptionHandler
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(oauth_token: session[:user_id]) if session[:user_id]
  end

end
