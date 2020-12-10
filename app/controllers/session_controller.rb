class SessionController < ApplicationController
  skip_before_action :require_authenticated_user, except: [:destroy]
  def new
    redirect_to user_path(current_user) if session[:user_id] 
  end

  def create
    redirect_to user_path(current_user) if session[:user_id]

    user = User.find_by(username: params[:user][:username])

    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to new_user_path
  end
end
