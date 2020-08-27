# frozen_string_literal: true

require 'application_system_test_case'

class UsersFollowersTest < ApplicationSystemTestCase
  test 'index follwers' do
    visit users_path
    click_link users(:steave).name.to_s
    click_link '1フォロワー'
    assert_text 'TonyStark'
  end
end
