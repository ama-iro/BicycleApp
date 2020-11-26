class Post < ApplicationRecord
  belongs_to :user
  validates :area, presence: true
  validates :place, presence: true
  validates :required_time, presence: true
  validates :description, length: { maximum: 400 },
                          presence: true

end
