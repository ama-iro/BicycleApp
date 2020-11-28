require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }

  describe "ユーザー登録ページ" do
    context "ユーザー登録処理" do
      it "有効なユーザーでユーザー登録を行うとユーザー登録成功のフラッシュ
         が表示されること" do
        visit new_user_registration_path
        fill_in "ユーザー名", with: "name2"
        select "男性", from: "性別"
        select "1991", from: "user_birthday_1i"
        select "11", from: "user_birthday_2i"
        select "12", from: "user_birthday_3i"
        fill_in "メールアドレス", with: "test2@example.com"
        fill_in "パスワード", with: "testpassword2"
        fill_in "確認用パスワード", with: "testpassword2"
        click_button "Sign up"
        expect(page).to have_text("アカウント登録が完了しました。")
      end
    end
  end

  describe "プロフィール編集ページ" do
    before do
      valid_login(user)
      visit users_show_path
      click_link "編集"
    end

    context "ページレイアウト" do
      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title('プロフィール編集')
      end
    end
  end
end
