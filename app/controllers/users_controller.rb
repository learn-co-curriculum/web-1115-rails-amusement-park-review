class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
      # redirect_to "/users/#{@user.id}"
      # redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # binding.pry
    @user = User.find_by(id: params[:id])
    if flash[:notice] && flash[:notice].class != String
       flash.now[:notice] = "Thanks for riding the #{@user.rides.last.attraction.name}!"
    end
  end

  private 

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
    end
end