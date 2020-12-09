class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit; end

  def update; end

  def show; end

  def destory; end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_movie
    @user = User.find_by_id(params[:id])
  end
end
