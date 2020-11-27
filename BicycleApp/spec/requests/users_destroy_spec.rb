require "rails_helper"

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
end
