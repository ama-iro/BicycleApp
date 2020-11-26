class Post < ApplicationRecord
  validates :
  validates :area, presence: true
  validates :place, presence: true
  validates :required_time, presence: true
  validates :description, length: { maximum: 400 }

  belongs_to :user
end
