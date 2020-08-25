# frozen_string_literal: true

require 'application_system_test_case'

class UsersFollowingsTest < ApplicationSystemTestCase
  test 'index follwings' do
    visit "users/#{users(:tony).id}/followings"
    assert_text 'SteaveRogers'
  end
end
