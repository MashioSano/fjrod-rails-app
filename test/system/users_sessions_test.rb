# frozen_string_literal: true

require 'application_system_test_case'

class UsersSessionsTest < ApplicationSystemTestCase
  test 'create session' do
    visit root_path
    click_link 'ログイン'
    fill_in 'Eメール', with: 'tony@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    assert_text 'ログインしました'
  end

  test 'delete session' do
    sign_in_as('tony@example.com', 'password')
    click_link 'ログアウト'
    assert_text 'ログアウトしました'
  end
end
