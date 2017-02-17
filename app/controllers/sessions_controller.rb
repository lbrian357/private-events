class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in(user)
      flash[:success] = "Welcome #{user.name}"
      redirect_to user_path(user)
    else
      flash[:danger] = 'Invalid email'
      render 'new'
    end
  end
end
