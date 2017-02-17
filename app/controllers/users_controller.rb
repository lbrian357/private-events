class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Error creating account: #{@user.errors.messages}"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
