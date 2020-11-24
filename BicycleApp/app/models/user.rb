class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :password, format: { with: VALID_PASSWORD_REGEX },
                       length: { minimum: 8 },
                       on: :create
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :name, presence: true, length: { maximum: 20 }
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :introduction, length: { maximum: 200 }



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         # :omniauthable, omniauth_providers:[:twitter]


  private
    def downcase_email
      self.email = email.downcase
    end

end
