require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let!(:user) { create(:user) }

  before do
    visit new_user_session_path
  end

  describe "ログインページ" do
    context "ページレイアウト" do
      it "「Log in」の文字列が存在することを確認" do
        expect(page).to have_content 'Log in'
      end

      it "ヘッダーにログインページへのリンクがあることを確認" do
        expect(page).to have_link 'ログイン', href: new_user_session_path
      end

      it "ログインフォームのラベルが正しく表示される" do
        expect(page).to have_content 'メールアドレス'
        expect(page).to have_content 'パスワード'
      end

      # it "ログインフォームが正しく表示される" do
      #   expect(page).to have_css 'input#user_email'
      #   expect(page).to have_css 'input#user_password'
      # end

      it "ログインボタンが表示される" do
        expect(page).to have_button 'Log in'
      end
    end
  end
end
