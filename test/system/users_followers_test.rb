# frozen_string_literal: true

require 'application_system_test_case'

class UsersFollowersTest < ApplicationSystemTestCase
  test 'index follwers' do
    visit "users/#{users(:steave).id}/followers"
    assert_text 'TonyStark'
  end
end
