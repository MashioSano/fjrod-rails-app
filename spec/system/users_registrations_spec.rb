# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Registrations', type: :system do
  let(:tony) { FactoryBot.create(:tony_stark) }

  scenario 'create user' do
    visit root_path
    click_link 'アカウント登録'
    fill_in '名前', with: 'PeterParker'
    fill_in 'Eメール', with: 'peter@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'
    expect { click_button 'アカウント登録' }.to change { User.count }.by(1)
    expect(page).to have_text('アカウント登録が完了しました。')
  end

  scenario 'update user' do
    login_user(tony.email, tony.password)
    visit edit_user_registration_path
    fill_in '名前', with: 'MorganStark'
    attach_file('db/seeds/images/user_default.jpeg') do
      find('input[type="file"]').click
    end
    click_button '更新'
    expect(page).to have_text('アカウント情報を変更しました。')
  end

  scenario 'delete user', js: true do
    login_user(tony.email, tony.password)
    visit edit_user_registration_path
    expect do
      accept_confirm do
        click_button 'アカウント削除'
      end
      expect(page).to have_text('アカウントを削除しました。またのご利用をお待ちしております。')
    end.to change { User.count }.by(-1)
  end
end
