require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post_yesterday) { create(:post, :yesterday) }
  let(:post_one_week_ago) { create(:post, :one_week_ago) }
  let(:post_one_month_ago) { create(:post, :one_month_ago) }
  let(:post) { create(:post) }

  context "バリデーション" do
    it "有効な状態であること" do
      expect(post).to be_valid
    end

    it "地域が無ければ無効であること" do
      post = build(:post, area: nil)
      post.valid?
      expect(post.errors[:area]).to include("を入力してください")
    end

    it "場所が無ければ無効であること" do
      post = build(:post, place: nil)
      post.valid?
      expect(post.errors[:place]).to include("を入力してください")
    end

    it "所要時間が無ければ無効であること" do
      post = build(:post, required_time: nil)
      post.valid?
      expect(post.errors[:required_time]).to include("を入力してください")
    end

    it "コース詳細が無ければ無効であること" do
      post = build(:post, description: nil)
      post.valid?
      expect(post.errors[:description]).to include("を入力してください")
    end

    it "コース詳細が400文字以上ならば無効であること" do
      post = build(:post, description: "a" * 401)
      post.valid?
      expect(post.errors[:description]).to include("は400文字以内で入力してください")
    end
  end

  context "投稿順序" do
    it "最も最近の投稿が最初の投稿になっていること" do
      expect(post).to eq Post.first
    end
  end
end
