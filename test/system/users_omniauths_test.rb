# frozen_string_literal: true

require 'application_system_test_case'

class UsersOmniauthsTest < ApplicationSystemTestCase
  test 'user create by omniauth' do
    visit root_path
    click_link 'ログイン'
    OmniAuth.config.add_mock(:github, info: { email: 'thor@example.com', nickname: 'thor' })
    click_link 'GitHubでログイン'
    assert_text 'Github アカウントによる認証に成功しました。'
  end
end
