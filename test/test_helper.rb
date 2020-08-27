# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'simplecov'

SimpleCov.start 'rails'

module SignInHelper
  def sign_in_as(email, passwword)
    visit new_user_session_path
    fill_in 'Eメール', with: email
    fill_in 'パスワード', with: passwword
    click_button 'ログイン'
  end
end

module ActiveSupport
  class TestCase
    include SignInHelper
    # Run tests in parallel with specified workers
    # parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    OmniAuth.config.test_mode = true
  end
end
