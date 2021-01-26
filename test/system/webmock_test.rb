# frozen_string_literal: true

require 'application_system_test_case'
require 'webmock/minitest'

class WebMockTest < ApplicationSystemTestCase
  test 'localhostへのリクエストはすべて許可する' do
    WebMock.disable_net_connect!(
      allow_localhost: true
    )
  end

  test 'www.example.comへアクセス' do
    WebMock.allow_net_connect! # この行がないとエラーになる
    Net::HTTP.get('www.example.com', '/')
  end
end
