require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できるとき' do
      it 'contentが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できないとき' do
      it 'contentが空では投稿できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'コメントを入力してください'
      end
      it 'ユーザーと紐づいていなければ投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Userを入力してください'
      end
      it 'ポージングと紐づいていなければ投稿できない' do
        @comment.posing = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Posingを入力してください'
      end
    end
  end
end
