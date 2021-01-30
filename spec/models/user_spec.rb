# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーフォロー' do
    before do
      @tony = FactoryBot.create(:tony_stark)
      @steave = FactoryBot.create(:steave_rogers)
      @relationship = Relationship.create(follower: @tony, following: @steave)
    end
    context 'SteaveがTonyをフォローしているとき' do
      it 'フォローを解除できること' do
        expect { @steave.unfollow(@tony) }.to change(@steave.active_relationships, :count).by(-1)
      end
      it '1回しかフォローできないこと' do
        expect { @steave.follow(@tony) }.to change(@steave.active_relationships, :count).by(0)
      end
      it 'followed_by?メソッドがtrueを返すこと' do
        expect(@tony.followed_by?(@steave)).to be true
      end
    end
    context 'TonyがSteaveをフォローしていないとき' do
      it 'フォローできること' do
        expect { @tony.follow(@steave) }.to change(@tony.active_relationships, :count).by(1)
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
