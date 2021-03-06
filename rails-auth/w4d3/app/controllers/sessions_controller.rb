class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      log_in(user)

      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash[:fail] = "You have failed to log in"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end
