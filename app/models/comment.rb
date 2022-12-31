class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :posing

  validates :content, presence: true
end
