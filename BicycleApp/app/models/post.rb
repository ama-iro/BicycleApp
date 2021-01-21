class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  default_scope -> { order(created_at: :desc) }
  validates :area, presence: true
  validates :place, presence: true
  validates :required_time, presence: true
  validates :description, length: { maximum: 400 }, presence: true


  def feed_comment(post_id)
    Comment.where("post_id = ?", post_id)
  end



end
