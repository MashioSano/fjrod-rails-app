# frozen_string_literal: true

require 'application_system_test_case'

class UsersRegistrationsTest < ApplicationSystemTestCase
  test 'create user' do
    visit '/users/sign_up'
    fill_in '名前', with: 'PeterParker'
    fill_in 'Eメール', with: 'peter@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'
    click_button 'アカウント登録'
    assert_text 'アカウント登録が完了しました。'
  end

  test 'update user' do
    sign_in_as 'tony@example.com', 'password'
    visit '/users/edit'
    fill_in '名前', with: 'MorganStark'
    attach_file('db/seeds/images/user_default.jpeg') do
      find('input[type="file"]').click
    end
    click_button '更新'
    assert_text 'アカウント情報を変更しました。'
    visit "/users/#{users(:tony).id}"
    assert_selector 'img', class: 'user-icon'
  end

  test 'delete user' do
    sign_in_as 'tony@example.com', 'password'
    visit '/users/edit'
    accept_confirm do
      click_button 'アカウント削除'
    end
    assert_text 'アカウントを削除しました。またのご利用をお待ちしております。'
  end
end
