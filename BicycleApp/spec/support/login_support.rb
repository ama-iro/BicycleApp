module LoginSupport
  def valid_login(user)
    visit new_user_session_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_button 'Log in'
  end
end
