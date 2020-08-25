require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'show user' do
    visit "/users/#{users(:tony).id}"
    assert_text 'TonyStark'
  end
end
