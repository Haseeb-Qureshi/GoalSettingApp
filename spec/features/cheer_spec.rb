require 'rails_helper'

feature "Cheering" do
  subject(:user1) { create(:user) }
  let(:user2) { user2 = create(:user); login(user2); add_goal("User2's goal"); user2 }

  before(:each) do
    login(user1)
  end

  it "should be able to cheer another user" do
    visit user_url(user2)
    click_button "Cheer"
    expect(page).to have_content("+1")
  end

  it "should only be able to cheer 5 times" do
    visit user_url(user2)
    5.times { click_button "Cheer" }
    expect(page).to have_content ("+5")
    expect(page).to_not have_button("Cheer")
  end
end
