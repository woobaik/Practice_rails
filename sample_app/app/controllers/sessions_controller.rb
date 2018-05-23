class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if
      user && user.authenticate(params[:session][:password])
      log_in(user)
      remember(user)
      redirect_to user
    else
      flash.now[:danger] = "Invalid email / Password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in
    redirect_to root_url
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanet[:remember_token] = user.remember_token
  end
end
