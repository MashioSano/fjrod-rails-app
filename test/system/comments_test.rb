require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  test 'index comment' do
    visit "/reports/#{reports(:report1).id}/comments"
    assert_text 'コメント一覧'
  end

  test 'show comment' do
    visit "/reports/#{reports(:report1).id}/comments/#{comments(:comment1).id}"
    assert_text '確認しました OKです'
  end

  test 'create comment' do
    sign_in_as 'steave@example.com', 'password'
    visit "/reports/#{reports(:report1).id}/comments/new"
    fill_in '説明文', with: 'LGTMです'
    click_button '登録する'
    assert_text '作成しました'
  end

  test 'update comment' do
    sign_in_as 'steave@example.com', 'password'
    visit "/reports/#{reports(:report1).id}/comments/#{comments(:comment1).id}/edit"
    fill_in '説明文', with: 'メンターの佐野です  よろしくお願いします'
    click_button '更新する'
    assert_text '更新しました'
  end

  test 'delete book' do
    sign_in_as 'steave@example.com', 'password'
    visit "/reports/#{reports(:report1).id}/comments/#{comments(:comment1).id}"
    click_link('コメントを削除')
    assert_text '削除しました'
  end
end
