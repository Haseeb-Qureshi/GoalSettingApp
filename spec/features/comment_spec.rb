require 'rails_helper'

feature "create comments on goal" do

  it "has a new comment form for each goal" do
    create_goal
    expect(page).to have_button("Comment")
  end

  it "creates new comments on each goal" do
    create_goal
    add_comment("goal_comment", "You're a failure.", "Comment")
    expect(page).to have_content("You're a failure.")
  end

end

feature "create comments on user" do

  it "user has a comment form" do
    user = create(:user)
    login(user)
    expect(page).to have_button("Comment on #{user.username}")
  end

  it "creates new comments on the user" do
    user = create(:user)
    login(user)
    add_comment("user_comment", "You suck.", "Comment on #{user.username}")
    expect(page).to have_content("You suck.")
  end

end
