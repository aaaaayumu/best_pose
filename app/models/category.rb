class Category < ActiveHash::Base

  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ボディビル' },
    { id: 2, name: 'クラシックフィジーク' },
    { id: 3, name: 'メンスフィジーク' },
    { id: 4, name: 'マスキュラーフィジーク' },
    { id: 5, name: 'スポーツモデル' },
    { id: 6, name: 'ウィメンズフィジーク(女子フィジーク)' },
    { id: 7, name: 'フィギュア(ボディフィットネス)' },
    { id: 8, name: 'ウェルネス' },
    { id: 9, name: 'ビキニ' },
    { id: 10, name: 'モノキニ' },
    { id: 11, name: 'フィットウェアモデル' },
    { id: 12, name: 'ドレス' },
    { id: 13, name: 'その他のカテゴリー' }
  ]

  include ActiveHash::Associations
  has_many :posings
end