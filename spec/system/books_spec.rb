# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :system do
  let!(:book) { FactoryBot.create(:book, user: tony, title: '伝え方が9割', memo: 'なぜ、伝え方で結果が変わるのか?') }
  let(:tony) { FactoryBot.create(:tony_stark, email: 'tony@example.com') }
  example '本の一覧を表示する' do
    visit root_path
    expect(page).to have_text('本一覧')
    expect(page).to have_text('伝え方が9割')
  end

  example '本の詳細を表示する' do
    visit books_path
    first('tbody tr').click_link '本の詳細'
    expect(page).to have_text('伝え方が9割')
    expect(page).to have_text('なぜ、伝え方で結果が変わるのか?')
  end

  example '本を登録する' do
    login_user('tony@example.com', 'password')
    visit books_path
    click_link '本を作成'
    fill_in 'タイトル', with: 'パーフェクトRuby on Rails'
    fill_in 'メモ', with: 'Rails6.0.1に対応'
    attach_file('db/seeds/images/user_default.jpeg')
    click_button '登録する'
    expect(page).to have_text('作成しました')
    expect(page).to have_text('パーフェクトRuby on Rails')
  end

  example '本を編集する' do
    login_user('tony@example.com', 'password')
    visit book_path(book)
    click_link '本を編集'
    fill_in 'タイトル', with: 'これからはじめるVue.js'
    fill_in 'メモ', with: 'サンプルコードはダウンロードできます'
    click_button '更新する'
    expect(page).to have_text('更新しました')
    expect(page).to have_text('これからはじめるVue.js')
  end

  example '本を削除する', js: true do
    login_user('tony@example.com', 'password')
    visit books_path(book)
    expect(page).to have_text('伝え方が9割')
    accept_alert do
      first('tbody tr').click_link '本を削除'
    end
    expect(page).to have_text('削除しました')
    expect(page).to_not have_text('伝え方が9割')
  end
end
