module AuthHelper
  def create_goal
    user = create(:user)
    login(user)
    fill_in "Goal", with: "Learn Capybara"
    click_button "Create Goal"
  end
end
