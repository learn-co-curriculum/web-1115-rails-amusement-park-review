class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    # binding.pry
    @user = User.find_by(id: params["user"]["id"])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    # binding.pry
    session[:user_id] = nil

    redirect_to root_path
  end
end