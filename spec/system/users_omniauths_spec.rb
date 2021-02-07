# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Omniauth', type: :system do
  before do
    OmniAuth.config.add_mock(:github, info: { email: 'thor@example.com', nickname: 'Thor' })
  end
  example 'GitHubのアカウントでログインする' do
    visit root_path
    click_link 'ログイン'
    click_link 'GitHubでログイン'
    expect(page).to have_text('Github アカウントによる認証に成功しました。')
    expect(page).to have_text('Thor ユーザー情報の編集 | ログアウト')
  end
end
