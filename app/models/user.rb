class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posings
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_comments, through: :likes, source: :comment
  
  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', if: :password_errors_blank?

  def password_errors_blank?
    errors[:password].blank?
  end

  def liked_by?(comment_id)
    likes.where(post_id: post_id).exists?
  end
end
