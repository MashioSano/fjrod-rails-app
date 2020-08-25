# frozen_string_literal: true

require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  test 'create relationship' do
    sign_in_as 'steave@example.com', 'password'
    visit "/users/#{users(:tony).id}"
    click_button 'フォロー'
    has_text?('フォローを解除')
  end

  test 'delete relationship' do
    sign_in_as 'tony@example.com', 'password'
    visit "/users/#{users(:steave).id}"
    click_button 'フォローを解除'
    has_text?('フォロー')
  end
end
