# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, type: :system) do |example|
    if ENV['HEADED'] || example.metadata[:js]
      driven_by :selenium, using: :chrome
    else
      driven_by :selenium, using: :headless_chrome
    end
  end
end
