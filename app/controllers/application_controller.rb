class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # def current_user=(user)
  #   @current_user = user
  #   # session[:session_token] = user.session_token
  # end
  #
  # def current_user
  #   return nil if session[:session_token].nil?
  #   @current_user ||= User.find_by_session_token(session[:session_token])
  # end
  #
  # def longout_current_user!
  #   current_user.reset_session_token!
  #   session[:session_token] = nil
  # end
  #
  # def require_current_user!
  #   redirect_to new_session_url if current_user.nil?
  # end
end
