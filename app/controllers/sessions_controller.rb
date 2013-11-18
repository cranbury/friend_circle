class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    login_user!(params[:user][:email], params[:user][:password])
    redirect_to user_url(current_user)
  end

  def destroy
    logout_user!
    session[:session_token] = nil
    redirect_to user_url(current_user)
  end
end