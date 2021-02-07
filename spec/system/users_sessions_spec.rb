# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Sessions', type: :system do
  let!(:tony) { FactoryBot.create(:tony_stark, name: 'Tony Stark', email: 'tonystark@example.com') }

  example 'ログインする' do
    visit root_path
    click_link 'ログイン'
    fill_in 'Eメール', with: 'tonystark@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_text('ログインしました')
    expect(page).to have_text('Tony Stark ユーザー情報の編集 | ログアウト')
  end

  example 'ログアウトする' do
    login_user('tonystark@example.com', 'password')
    click_link 'ログアウト'
    expect(page).to have_text('ログアウトしました')
    expect(page).to have_text('アカウント登録 | ログイン')
  end
end
