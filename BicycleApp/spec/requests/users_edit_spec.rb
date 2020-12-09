require "rails_helper"

RSpec.describe "プロフィール編集", type: :request do
  let(:user) { create(:user) }

  it "有効なプロフィール編集" do
    valid_login(user)
    visit edit_user_registration_path
    expect(page).to have_content("Edit User")
    fill_in "ユーザー名", with: "change_name"
    fill_in "自己紹介", with: "change introduction"
    click_button "保存"
    expect(page).to have_text("アカウント情報を変更しました。")
  end

  it "無効なプロフィール編集" do
    valid_login(user)
    visit edit_user_registration_path
    expect(page).to have_content("Edit User")
    fill_in "ユーザー名", with: ""
    click_button "保存"
    expect(page).to have_text("エラーが発生したため ユーザ は保存されませんでした。")
  end
end
