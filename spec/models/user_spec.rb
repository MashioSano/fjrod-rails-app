# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーフォロー' do
    let(:tony) { FactoryBot.create(:tony_stark) }
    let(:steave) { FactoryBot.create(:steave_rogers) }
    context 'SteaveがTonyをフォローしているとき' do
      let!(:relationship) { Relationship.create(follower: tony, following: steave) }
      it 'フォローを解除できること' do
        expect { steave.unfollow(tony) }.to change { steave.active_relationships.count }.by(-1)
      end
      it '1回しかフォローできないこと' do
        expect { steave.follow(tony) }.to change { steave.active_relationships.count }.by(0)
      end
      it 'followed_by?メソッドがtrueを返すこと' do
        expect(tony.followed_by?(steave)).to be true
      end
    end
    context 'TonyがSteaveをフォローしていないとき' do
      it 'フォローできること' do
        expect { tony.follow(steave) }.to change { tony.active_relationships.count }.by(1)
      end
    end
  end

  describe 'omniauth認証によるユーザー登録' do
    let(:auth) { OmniAuth.config.add_mock(:github, info: { email: 'thor@example.com', nickname: 'thor' }, uid: '123456') }
    context 'uidとproviderが同じ値のユーザーが存在しないとき' do
      it 'ユーザーが作成されること' do
        expect { User.from_omniauth(auth) }.to change { User.count }.by(1)
      end
    end

    context 'uidとproviderが同じ値のユーザーがすでに存在するとき' do
      let!(:authroized_user) { User.create(name: 'peter', email: 'peter@example.com', uid: '123456', provider: 'github', password: 'password', password_confirmation: 'password') }
      it 'ユーザーが作成されないこと' do
        expect { User.from_omniauth(auth) }.to change { User.count }.by(0)
      end
    end
  end
end
