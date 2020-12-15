include ApplicationHelper # full_titleメソッドの読み込み

def login_for_request(user)
  post user_session_path, params: { session: { email: user.email,
                                        password: user.password } }
end
