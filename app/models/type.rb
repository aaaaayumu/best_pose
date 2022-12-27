class Type < ActiveHash::Base

  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'フロントポーズ' },
    { id: 2, name: 'バックポーズ' },
    { id: 3, name: 'サイドポーズ' },
    { id: 4, name: 'フロントダブルバイセプス' },
    { id: 5, name: 'フロントラットスプレッド' },
    { id: 6, name: 'サイドチェスト' },
    { id: 7, name: 'バックダブルバイセプス' },
    { id: 8, name: 'バックラットスプレッド' },
    { id: 9, name: 'サイドトライセプス' },
    { id: 10, name: 'アブドミナルアンドサイ' },
    { id: 11, name: 'モストマスキュラー' },
    { id: 12, name: 'その他のポーズ' }
  ]

  include ActiveHash::Associations
  has_many :posings
end