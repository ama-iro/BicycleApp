require "rails_helper"

RSpec.describe "プロフィールページ", type: :request do
  let!(:user) { create(:user) }

  it "ログイン状態ならば、プロフィールページが表示されること" do
    valid_login(user)
    visit "/users/show/#{user.id}"
    expect(page).to have_content "about me"
  end

  it "ログインしていない状態ならば、ログイン画面に戻されること" do
    visit "/users/show/#{user.id}"
    expect(page).to have_content "Log in"
  end

  it "プロフィールページの「編集」リンクは機能しているか" do
    valid_login(user)
    visit "/users/show/#{user.id}"
    click_link "編集"
    expect(page).to have_content "Edit User"
  end
end
