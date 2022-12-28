class Posing < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :group
  belongs_to :category
  belongs_to :type

  validates :image, presence: true, blob: { content_type: :image }
  validates :group_id, :category_id, :type_id, numericality: { other_than: 0, message: 'を選択してください' }
end
