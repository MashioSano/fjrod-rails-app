require 'rails_helper'

RSpec.describe "Books", type: :system do
  let!(:book) { FactoryBot.create(:book, user: tony) }
  let(:tony) { FactoryBot.create(:tony_stark) }
  scenario 'index book' do
    visit root_path
    expect(page).to have_text('本一覧')
    expect(page).to have_text('伝え方が9割')
  end

  scenario 'show book' do
    visit books_path
    first('tbody tr').click_link '本の詳細'
    expect(page).to have_text('伝え方が9割')
    expect(page).to have_text('なぜ、伝え方で結果が変わるのか?')
  end

  scenario 'create book' do
    login_user(tony.email, tony.password)
    visit books_path
    click_link '本を作成'
    fill_in 'タイトル', with: 'パーフェクトRubyonRails'
    fill_in 'メモ', with: 'Rails6.0.1に対応'
    attach_file('db/seeds/images/user_default.jpeg') do
      find('input[type="file"]').click
    end
    click_button '登録する'
    expect(page).to have_text('作成しました')
  end

  scenario 'update book' do
    login_user(tony.email, tony.password)
    visit book_path(book)
    click_link '本を編集'
    fill_in 'タイトル', with: 'これからはじめるVue.js'
    fill_in 'メモ', with: 'サンプルコードはダウンロードできます'
    click_button '更新する'
    expect(page).to have_text('更新しました')
  end

  scenario 'delete book', js: true do
    login_user(tony.email, tony.password)
    visit books_path(book)
    expect do
      accept_alert do
        first('tbody tr').click_link '本を削除'
      end
      expect(page).to have_text('削除しました')
    end.to change { tony.books.count }.by(-1)
  end
end
