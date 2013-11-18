class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    if @user.save
      # fail
      login_user!(params[:user][:email], params[:user][:password])
      render :show
    else
      render :json => @user.errors, :status => :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

end