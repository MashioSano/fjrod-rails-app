# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  test 'index comment' do
    visit report_path(reports(:report1))
    click_link 'コメント一覧'
    assert_text 'コメント一覧'
    assert_text '確認しました OKです'
  end

  test 'show comment' do
    visit report_comments_path(reports(:report1))
    click_link comments(:comment1).description.to_s
    assert_text 'コメント詳細'
    assert_text '確認しました OKです'
  end

  test 'create comment' do
    sign_in_as 'steave@example.com', 'password'
    visit report_comments_path(reports(:report1))
    click_link 'コメントを作成'
    fill_in '説明文', with: 'LGTMです'
    click_button '登録する'
    assert_text '作成しました'
  end

  test 'update comment' do
    sign_in_as 'steave@example.com', 'password'
    visit report_comment_path(reports(:report1), comments(:comment1))
    click_link 'コメントを編集'
    fill_in '説明文', with: 'メンターの佐野です  よろしくお願いします'
    click_button '更新する'
    assert_text '更新しました'
  end

  test 'delete book' do
    sign_in_as 'steave@example.com', 'password'
    visit report_comment_path(reports(:report1), comments(:comment1))
    click_link('コメントを削除')
    assert_text '削除しました'
  end
end
