# frozen_string_literal: true

require 'application_system_test_case'

class UsersFollowingsTest < ApplicationSystemTestCase
  test 'index follwings' do
    visit users_path
    click_link users(:tony).name.to_s
    click_link '1フォロー中'
    assert_text 'SteaveRogers'
  end
end
