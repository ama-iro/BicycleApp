require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "トップページ" do
    context "ページ全体" do
      before do
        visit root_path
      end

      it "アプリ名の文字列が存在することを確認" do
        expect(page).to have_content 'explain'
      end

    end
  end

  describe "ヘルプページ" do
    before do
      visit about_path
    end

    it "MTTBとは？の文字列が存在することを確認" do
      expect(page).to have_content 'MTTBとは？'
    end

  end

end
