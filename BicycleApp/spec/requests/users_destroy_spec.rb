require "rails_helper"

<<<<<<< HEAD
RSpec.describe "userの消去", type: :request do
  let(:other_user) { create(:user) }
  let(:post) { create(:post, user: user) }

  context "料理が紐づくユーザーを削除した場合" do
    it "ユーザーと同時に紐づく料理も削除される" do
      login_for_request(user)
      expect {
        delete user_path(user)
      }.to change(Post, :count).by(-1)
    end
  end
=======
RSpec.describe "ユーザーの削除", type: :request do
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }
  let!(:other_user) { create(:other_user) }

  context "管理者ユーザーの場合" do
    it "ユーザーを削除後、ユーザー一覧ページにリダイレクト" do
      # current_user_mock = double('current_user')
      # allow(current_user_mock).to receive(:find)
      # allow(current_user_mock).to receive(:admin?)
      # allow(current_user_mock).to receive(:destroy)
      # destroy_user = User.new
      # allow(destroy_user).to receive(:destroy_user).and_return(current_user_mock)
      # valid_login(admin)
      # allow(User).to receive(:current_user).and_return(admin)
      valid_login(admin)
      current_user = user
      expect {
         delete "/users/#{user.id}"
      }.to change(User, :count).by(-1)
      redirect_to users_index_path
      follow_redirect!
      expect(response).to render_template('/')
      # visit "/users/show/#{admin.id}"
      # expect(page).to have_content "管理者ユーザー"
    end
  end
  context "管理者以外のユーザーの場合" do
   it "自分のアカウントを削除できること" do
     login_for_request(user)
     expect {
       delete "/users/#{user.id}"
     }.to change(User, :count).by(-1)
     redirect_to root_path
   end

   it "自分以外のユーザーを削除しようとすると、トップページへリダイレクトすること" do
     login_for_request(user)
     expect {
       delete "/users/#{other_user.id}"
     }.not_to change(User, :count)
     expect(response).to have_http_status "302"
     expect(response).to redirect_to root_path
   end
 end

 context "ログインしていないユーザーの場合" do
   it "ログインページへリダイレクトすること" do
     expect {
       delete "/users/#{other_user.id}"
     }.not_to change(User, :count)
     expect(response).to have_http_status "302"
     expect(response).to redirect_to new_user_session_path
   end
 end
>>>>>>> users
end
