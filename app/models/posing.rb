class Posing < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :group
  belongs_to :category
  belongs_to :type
end
