# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  test 'index book' do
    visit '/books'
    assert_text '本一覧'
  end

  test 'show book' do
    visit "/books/#{books(:softskills).id}"
    assert_text 'SOFTSKILLS'
  end

  test 'create book' do
    sign_in_as 'steave@example.com', 'password'
    visit '/books/new'
    fill_in 'タイトル', with: 'パーフェクトRubyonRails'
    fill_in 'メモ', with: 'Rails6.0.1に対応'
    click_button '登録する'
    assert_text '作成しました'
  end

  test 'edit book' do
    sign_in_as 'steave@example.com', 'password'
    visit "/books/#{books(:softskills).id}/edit"
    fill_in 'タイトル', with: 'チェリー本'
    fill_in 'メモ', with: 'サンプルコードはダウンロードできます'
    click_button '更新する'
    assert_text '更新しました'
  end

  test 'delete book' do
    sign_in_as 'steave@example.com', 'password'
    visit '/books'
    accept_alert do
      click_link('本を削除')
    end
    assert_text '削除しました'
  end
end
