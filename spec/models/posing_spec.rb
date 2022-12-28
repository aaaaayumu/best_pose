require 'rails_helper'

RSpec.describe Posing, type: :model do
  before do
    @posing = FactoryBot.build(:posing)
  end

  describe 'ポージング投稿' do
    context '投稿できるとき' do
      it '全ての値が正しく入力されていれば投稿できる' do
        expect(@posing).to be_valid
      end
      it 'body_weightは空でも投稿できる' do
        @posing.body_weight = ''
        expect(@posing).to be_valid
      end
      it 'remarksは空でも投稿できる' do
        @posing.remarks = ''
        expect(@posing).to be_valid
      end
    end

    context '投稿できないとき' do
      it 'imageが空だと投稿できない' do
        @posing.image = nil
        @posing.valid?
        expect(@posing.errors.full_messages).to include 'ポージング画像を入力してください'
      end
      it 'groupが未選択だと投稿できない' do
        @posing.group_id = 0
        @posing.valid?
        expect(@posing.errors.full_messages).to include '団体を選択してください'
      end
      it 'categoryが未選択だと投稿できない' do
        @posing.category_id = 0
        @posing.valid?
        expect(@posing.errors.full_messages).to include 'カテゴリーを選択してください'
      end
      it 'typeが未選択だと投稿できない' do
        @posing.type_id = 0
        @posing.valid?
        expect(@posing.errors.full_messages).to include 'ポーズの種類を選択してください'
      end
      it 'userが紐づいていなければ投稿できない' do
        @posing.user = nil
        @posing.valid?
        expect(@posing.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
