require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーフォロー' do
    context 'フォローしているとき' do
      it 'フォローを解除できること' do
      end
      it '1回しかフォローできないこと' do
      end
    end
    context 'フォローしていないとき' do
      it 'フォローできること' do
      end
    end
    context 'フォローされているとき' do
      it 'followed_by?メソッドがtrueを返すこと' do
      end
    end
  end

  describe 'omniauth認証によるユーザー登録' do
    context 'uidとproviderが同じ値のユーザーが存在しないとき' do
      it 'ユーザーが作成されること' do
      end
    end

    context 'uidとproviderが同じ値のユーザーがすでに存在するとき' do
      it 'ユーザーが作成されないこと' do
      end
    end
  end
end
