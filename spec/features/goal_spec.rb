require 'rails_helper'

feature "create goal process" do
  it "has a goal form on user's show page" do
    user = create(:user)
    login(user)
    expect(page).to have_button("Create Goal")
  end

  it "shows the goal in user's show page after creating" do
    create_goal
    expect(page).to have_content "Learn Capybara"
  end
end

feature "mark completion" do
  it "can mark completion for a goal" do
    create_goal
    click_button "Completed"
    expect(page).to have_content "(Completed)"
  end
end

feature "edit a goal" do
  it "can edit goals" do
    create_goal
    click_link "Edit"
    fill_in "Goal", with: "Unlearn Capybara"
    click_button "Edit Goal"
    expect(page).to have_content "Unlearn Capybara"
  end
end


feature "delete goal" do
  it "can delete goals" do
    create_goal
    click_link "Delete"
    expect(page).to_not have_content "Learn Capybara"
  end
end
