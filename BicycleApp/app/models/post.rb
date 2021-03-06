class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :area, presence: true
  validates :place, presence: true
  validates :required_time, presence: true
  validates :description, length: { maximum: 400 }, presence: true
  validates :description, presence: true
  validate :picture_size

  def feed_comment(post_id)
    Comment.where("post_id = ?", post_id)
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, ":5MBより大きい画像はアップロードできません。")
      end
    end
end
