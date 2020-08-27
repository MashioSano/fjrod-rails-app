# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  test 'index book' do
    visit root_path
    assert_text 'SOFTSKILLS'
    assert_text '本一覧'
  end

  test 'show book' do
    visit books_path
    click_link '詳細'
    assert_text 'SOFTSKILLS'
    assert_text '参考になった'
  end

  test 'create book' do
    sign_in_as 'steave@example.com', 'password'
    visit books_path
    click_link '本を作成'
    fill_in 'タイトル', with: 'パーフェクトRubyonRails'
    fill_in 'メモ', with: 'Rails6.0.1に対応'
    attach_file('db/seeds/images/user_default.jpeg') do
      find('input[type="file"]').click
    end
    click_button '登録する'
    assert_text '作成しました'
    assert_selector 'img', class: 'book_picture'
  end

  test 'update book' do
    sign_in_as 'steave@example.com', 'password'
    visit book_path(books(:softskills))
    click_link '本を編集'
    fill_in 'タイトル', with: 'チェリー本'
    fill_in 'メモ', with: 'サンプルコードはダウンロードできます'
    click_button '更新する'
    assert_text '更新しました'
  end

  test 'delete book' do
    sign_in_as 'steave@example.com', 'password'
    visit books_path
    accept_alert do
      click_link('本を削除')
    end
    assert_text '削除しました'
  end
end
