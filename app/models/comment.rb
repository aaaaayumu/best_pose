class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :posing
  has_many :likes, dependent: :destroy
  has_many :liked_comments, through: :likes, source: :user

  validates :content, presence: true
end
