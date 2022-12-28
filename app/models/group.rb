class Group < ActiveHash::Base

  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'JBBF' },
    { id: 2, name: 'FWJ' },
    { id: 3, name: 'ベストボディジャパン' },
    { id: 4, name: 'サマースタイルアワード' },
    { id: 5, name: 'NABBA' },
    { id: 6, name: 'マッスルゲート' },
    { id: 7, name: 'APF' },
    { id: 8, name: 'NBBF' },
    { id: 9, name: 'その他の団体' }
  ]

  include ActiveHash::Associations
  has_many :posings
end