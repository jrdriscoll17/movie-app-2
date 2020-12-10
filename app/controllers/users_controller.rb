class UsersController < ApplicationController
  skip_before_action :require_authenticated_user, only: [:new, :create]
  before_action :find_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show; end

  def destory
    @user.delete
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
