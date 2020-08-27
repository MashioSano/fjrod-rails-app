# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @steave = users(:steave)
    @tony = users(:tony)
  end

  test '他のユーザーをフォローできる' do
    assert_difference('Relationship.count', +1) do
      @steave.follow(@tony)
    end
  end

  test 'ユーザーはフォローを解除できる' do
    @steave.follow(@tony)
    assert_difference('Relationship.count', -1) do
      @steave.unfollow(@tony)
    end
  end

  test '他のユーザーにフォローされている時trueを返す' do
    @steave.follow(@tony)
    assert_equal(true, @tony.followed_by?(@steave))
  end

  test 'omniauth認証によりユーザーが作成される' do
    auth = OmniAuth.config.add_mock(:github, info: { email: 'thor@example.com', nickname: 'thor' })
    assert_difference('User.count', +1) do
      User.from_omniauth(auth)
    end
  end

  test 'uidとproviderが同じ値のユーザーがすでに存在する場合ユーザーを作成しない' do
    User.create(name: 'thor', email: 'thor@example.com', uid: '123456', provider: 'github', password: 'password', password_confirmation: 'password')
    auth = OmniAuth.config.add_mock(:github, info: { email: 'thor@example.com', nickname: 'thor' }, uid: '123456')
    assert_no_difference 'User.count' do
      @user = User.from_omniauth(auth)
    end
  end
end
