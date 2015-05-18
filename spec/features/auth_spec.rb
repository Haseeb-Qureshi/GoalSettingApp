require 'rails_helper'

feature "the signup process" do
  it "has a new user page" do
    visit "users/new"
    expect(page).to have_content("Sign Up")
  end

  feature "signing up a user with valid input" do
    it "shows username on the homepage after signup" do
      visit "users/new"
      fill_in "Username", with: "Haseeb"
      fill_in "Password", with: "haseebhaseeb"
      click_button "Sign Up"
      expect(page).to have_content("Haseeb")
    end
  end

  feature "signing up a user with invalid input" do
    it "shows error messages on invalid password" do
      visit "users/new"
      fill_in "Username", with: "Haseeb"
      click_button "Sign Up"
      expect(page).to have_content("Password is too short")
    end

    it "shows error messages on invalid username" do
      visit "users/new"
      click_button "Sign Up"
      expect(page).to have_content("Password is too short")
    end

    it "shows error messages on duplicate username" do
      visit "users/new"
      fill_in "Username", with: "Haseeb"
      fill_in "Password", with: "haseebhaseeb"
      click_button "Sign Up"
      click_link "Log Out"
      click_link "Sign Up"
      fill_in "Username", with: "Haseeb"
      fill_in "Password", with: "haseebhaseeb"
      click_button "Sign Up"

      expect(page).to have_content("Username has already been taken")
    end
  end
end

feature "logging in" do
  it "shows username on the homepage after login" do
    user = create(:user)
    login(user)
    expect(page).to have_content(user.username)
  end

  it "shows error messages on invalid login" do
    user = create(:user)
    visit "session/new"
    fill_in "Username", with: user.username
    fill_in "Password", with: "INVALID PASSWORD"
    click_button "Log In"
    expect(page).to have_content("Could not find that username/password")
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
