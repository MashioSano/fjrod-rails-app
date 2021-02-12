# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Registrations', type: :system do
  let!(:tony) { FactoryBot.create(:user, email: 'tony@example.com') }

  example 'アカウントを登録する' do
    visit root_path
    click_link 'アカウント登録'
    fill_in '名前', with: 'Peter Parker'
    fill_in 'Eメール', with: 'peter@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'
    click_button 'アカウント登録'
    expect(page).to have_text('アカウント登録が完了しました。')
    expect(page).to have_text('Peter Parker ユーザー情報の編集 | ログアウト')
  end

  example 'ユーザー情報を更新する' do
    login_user('tony@example.com', 'password')
    visit edit_user_registration_path
    fill_in '名前', with: 'Morgan Stark'
    attach_file('db/seeds/images/user_default.jpeg')
    click_button '更新'
    expect(page).to have_text('アカウント情報を変更しました。')
    expect(page).to have_text('Morgan Stark ユーザー情報の編集 | ログアウト')
  end

  example 'アカウントを削除する', js: true do
    login_user('tony@example.com', 'password')
    visit edit_user_registration_path
    accept_confirm do
      click_button 'アカウント削除'
    end
    expect(page).to have_text('アカウントを削除しました。またのご利用をお待ちしております。')
    expect(page).to have_text('アカウント登録 | ログイン')
  end
end
