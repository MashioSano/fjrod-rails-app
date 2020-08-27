# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'index users' do
    visit root_path
    click_link 'ユーザー一覧'
    assert_text 'ユーザー一覧'
    assert_text 'TonyStark'
  end

  test 'show user' do
    visit users_path
    click_link users(:tony).name.to_s
    assert_text 'TonyStark'
  end
end
