class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Alpha Blog #{@user.username}"
      redirect_to root_path
    else
      flash[:error] = "There Was an Error Signing Up"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You Successfully Updated Your Account"
      redirect_to root_path
    else
      render = 'edit'
    end 
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)

  end
end
