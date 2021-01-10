class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :password, format: { with: VALID_PASSWORD_REGEX },
                       length: { minimum: 8 },
                       on: :create
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :name, presence: true, length: { maximum: 20 }

  validates :introduction, length: { maximum: 200 }



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         # :omniauthable, omniauth_providers:[:twitter]

  def feed
    Post.where("user_id = ?", id)
  end

# お気に入り登録する
  def favorite(post)
    Favorite.create!(user_id: id, post_id: post.id)
  end

  # 投稿をお気に入り解除する
  def unfavorite(post)
    Favorite.find_by(user_id: id, post_id: post.id).destroy
  end

  # 現在のユーザーがお気に入り登録してたらtrueを返す
  def favorite?(post)
    !Favorite.find_by(user_id: id, post_id: post.id).nil?
  end


  private
    def downcase_email
      self.email = email.downcase
    end

end
