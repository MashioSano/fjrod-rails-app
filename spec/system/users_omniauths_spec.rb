# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Omniauth', type: :system do
  scenario 'user create by omniauth' do
    visit root_path
    click_link 'ログイン'
    OmniAuth.config.add_mock(:github, info: { email: 'thor@example.com', nickname: 'Thor' })
    expect do
      click_link 'GitHubでログイン'
      expect(page).to have_text('Github アカウントによる認証に成功しました。')
    end.to change { User.count }.by(1)
  end
end
