class CheersController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :redirect_if_cheering_self, only: :cheer
  before_action :redirect_if_not_enough_cheers


  def cheer
    cheer = Cheer.new(user_id: current_user.id, goal_id: params[:goal_id])
    current_user.cheers -= 1
    current_user.save!
    cheer.save!
    redirect_to :back
  end

  def leaderboard
    @goals = Goal.all.includes(:cheers)
  end

  private

  def redirect_if_not_enough_cheers
    redirect_to current_user if current_user.cheers <= 0
  end

  def redirect_if_cheering_self
    goal = Goal.find(params[:goal_id])
    redirect_to current_user if goal && goal.user == current_user
  end
end
