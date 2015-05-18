class GoalsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    flash[:errors] = @goal.errors.full_messages unless @goal.save
    redirect_to current_user
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to current_user
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    Goal.find(params[:id]).destroy!
    redirect_to current_user
  end

  def complete
    Goal.find(params[:id]).toggle!(:completed)
    redirect_to current_user
  end

  private

  def goal_params
    params.require(:goal).permit(:body, :completed)
  end
end
