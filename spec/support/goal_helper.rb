module GoalHelper
  def create_goal
    user = create(:user)
    login(user)
    add_goal("Learn Capybara")
  end

  def add_goal(goal)
    fill_in "Goal", with: goal
    click_button "Create Goal"
  end
end
