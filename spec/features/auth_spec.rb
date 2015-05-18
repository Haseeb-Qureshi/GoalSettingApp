require 'rails_helper'

feature "the signup process" do
  it "has a new user page" do
    visit "users/new"
    expect(page).to have_content("Sign Up")
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      visit "users/new"
      fill_in "Username", with: "Haseeb"
      fill_in "Password", with: "haseebhaseeb"
      click_button "Sign Up"
      expect(page).to have_content("Haseeb")
    end
  end
end

feature "logging in" do
  it "shows username on the homepage after login" do
    user = create(:user)
    login(user)
    expect(page).to have_content(user.username)
  end
end

feature "logging out" do
  it "begins with logged out state" do
    visit 'session/new'
    expect(page).to have_content("Sign In")
  end

  it "doesn't show username on the homepage after logout" do
    user = create(:user)
    login(user)
    click_link "Log Out"

    expect(page).to_not have_content(user.username)
  end
end
