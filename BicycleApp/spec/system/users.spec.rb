require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }

  describe "ユーザー登録ページ" do
    context "ユーザー登録処理" do
      it "有効なユーザーでユーザー登録を行うとユーザー登録成功のフラッシュが表示されること" do
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

      end
    end
  end
end
