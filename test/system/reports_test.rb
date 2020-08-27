# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  test 'index reports' do
    visit root_path
    click_link '日報一覧'
    assert_text '日報一覧'
    assert_text '個人アプリ開発1'
  end

  test 'show report' do
    visit reports_path
    click_link reports(:report1).title.to_s
    assert_text '日報詳細'
    assert_text '個人アプリ開発1'
  end

  test 'create report' do
    sign_in_as 'steave@example.com', 'password'
    visit reports_path
    click_link '日報を作成'
    fill_in 'タイトル', with: '初めての日報'
    fill_in '本文', with: 'Slackのアカウントを作成した'
    click_button '登録する'
    assert_text '作成しました'
  end

  test 'update report' do
    sign_in_as 'steave@example.com', 'password'
    visit report_path(reports(:report1))
    click_link '日報を編集'
    fill_in 'タイトル', with: '2日目'
    fill_in '本文', with: 'HTMLの基礎を学習'
    click_button '更新する'
    assert_text '更新しました'
  end

  test 'delete report' do
    sign_in_as 'steave@example.com', 'password'
    visit report_path(reports(:report1))
    click_link('日報を削除')
    assert_text '削除しました'
  end
end
