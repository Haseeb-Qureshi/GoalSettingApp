module AuthHelper
  def login(user)
    visit 'session/new'
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Log In"
  end
end
