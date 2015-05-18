class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: :show
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    # @user = User.includes(:goals).join("cheers ON cheers.goal_id = goals.id")
    #   .where(id: params[:id]).first
  end
end
