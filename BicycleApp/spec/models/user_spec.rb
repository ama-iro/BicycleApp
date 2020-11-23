require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context "バリデーション" do
    it "名前、メールアドレスがあれば有効な状態であること" do
      expect(user).to be_valid
    end

    it "nameがなければ無効であること"do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "名前が20文字以内であること" do
      user = build(:user, name: "a" * 21)
      user.valid?
      expect(user.errors[:name]).to include("は20文字以内で入力してください")
    end

    it "emailが無ければ無効であること" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください", "は不正な値です")
    end

    it "emailが正しい形式でないと無効になること" do
      user = build(:user, email: "invalidmail@example..com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "メールアドレスが255文字以内であること" do
      user = build(:user, email: "#{"a" * 244}@example.com")
      user.valid?
      expect(user.errors[:email]).to include("は255文字以内で入力してください")
    end

    it "重複したメールアドレスなら無効な状態であること" do
      other_user = build(:user, email: user.email)
      other_user.valid?
      expect(other_user.errors[:email]).to include("はすでに存在します")
    end

    it "メールアドレスは小文字で保存されること" do
     email = "ExamPle@example.com"
     user = create(:user, email: email)
     expect(user.email).to eq email.downcase
   end
  end
end
