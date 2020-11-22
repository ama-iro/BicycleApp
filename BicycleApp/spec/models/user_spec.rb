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
      expect(user.errors[:name])
    end
  end
end
