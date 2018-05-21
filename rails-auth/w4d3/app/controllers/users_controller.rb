class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      flash[:error_sign_up] = "There was an error"
      render 'new'
    end

  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end


  private

  def user_params
    params.require(:user).permit(:username,
                                 :password_digest)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end


end
