RSpec.configure do |config|
  # config.before(:each, type: :system) do
  #   driven_by :rack_test
  #   p "rackで実行しました"
  # end

  config.before(:each, type: :system, js: true) do
    if ENV['HEADED']
      driven_by :selenium, using: :chrome
      p "ブラウザを表示しました"
    else
      driven_by :selenium, using: :headless_chrome
      p "ヘッドレスで実行しました"
    end
  end
end
