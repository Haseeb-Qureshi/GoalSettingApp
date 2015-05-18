class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(user_params)
    if user
      log_in(user)
      redirect_to user
    else
      flash[:errors] = "Could not find that username/password"
      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    @current_user = nil
    redirect_to new_session_url
  end
end
