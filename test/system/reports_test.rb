require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  test 'index reports' do
    visit '/reports'
    assert_text '日報一覧'
  end

  test 'show book' do
    visit "/reports/#{reports(:report1).id}"
    assert_text '個人アプリ開発1'
  end

  test 'create book' do
    sign_in_as 'steave@example.com', 'password'
    visit '/reports/new'
    fill_in 'タイトル', with: '初めての日報'
    fill_in '本文', with: 'Slackのアカウントを作成した'
    click_button '登録する'
    assert_text '作成しました'
  end

  test 'edit book' do
    sign_in_as 'steave@example.com', 'password'
    visit "/reports/#{reports(:report1).id}/edit"
    fill_in 'タイトル', with: '2日目'
    fill_in '本文', with: 'HTMLの基礎を学習'
    click_button '更新する'
    assert_text '更新しました'
  end

  test 'delete book' do
    sign_in_as 'steave@example.com', 'password'
    visit "/reports/#{reports(:report1).id}"
    click_link('日報を削除')
    assert_text '削除しました'
  end
end
