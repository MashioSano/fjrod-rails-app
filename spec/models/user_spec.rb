# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーフォロー' do
    let(:tony) { FactoryBot.create(:tony_stark) }
    let(:steve) { FactoryBot.create(:steve_rogers) }
    context 'SteveがTonyをフォローしているとき' do
      let!(:relationship) { Relationship.create(follower: tony, following: steve) }
      it 'フォローを解除できること' do
        expect { steve.unfollow(tony) }.to change { steve.active_relationships.count }.by(-1)
      end
      it '1回しかフォローできないこと' do
        expect { steve.follow(tony) }.to_not change { steve.active_relationships.count }
      end
      it 'followed_by?メソッドがtrueを返すこと' do
        expect(tony.followed_by?(steve)).to be true
      end
    end
    context 'TonyがSteveをフォローしていないとき' do
      it 'フォローできること' do
        expect { tony.follow(steve) }.to change { tony.active_relationships.count }.by(1)
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
      let!(:authroized_user) { FactoryBot.create(:tony_stark, uid: '123456', provider: 'github') }
      it 'ユーザーが作成されないこと' do
        expect { User.from_omniauth(auth) }.to_not change { User.count }
      end
    end
  end
end
