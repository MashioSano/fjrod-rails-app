# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  let!(:tony) { FactoryBot.create(:tony_stark, name: 'Tony Stark', email: 'tony@example.com') }
  let!(:report) { FactoryBot.create(:report, user: tony) }
  let!(:comment) { report.comments.create!(description: '良いと思います', user: tony) }
  example 'コメントの一覧を表示する' do
    visit report_path(report)
    click_link 'コメント一覧'
    expect(page).to have_text('コメント一覧')
    expect(page).to have_text('良いと思います')
  end

  example 'コメントの詳細を表示する' do
    visit report_comments_path(report)
    click_link '良いと思います'
    expect(page).to have_text('コメント詳細')
    expect(page).to have_text('良いと思います')
  end

  example 'コメントを作成する' do
    login_user('tony@example.com', 'password')
    visit report_comments_path(report)
    click_link 'コメントを作成'
    fill_in '説明文', with: 'LGTMです'
    click_button '登録する'
    expect(page).to have_text('作成しました')
    expect(page).to have_text('LGTMです')
  end

  example 'コメントを編集する' do
    login_user('tony@example.com', 'password')
    visit report_comment_path(report, comment)
    click_link 'コメントを編集'
    fill_in '説明文', with: 'メンターの佐野です よろしくお願いします'
    click_button '更新する'
    expect(page).to have_text('更新しました')
    expect(page).to have_text('メンターの佐野です よろしくお願いします')
  end

  example 'コメントを削除する' do
    login_user('tony@example.com', 'password')
    visit report_comment_path(report, comment)
    expect(page).to have_text('良いと思います')
    click_link 'コメントを削除'
    expect(page).to have_text('削除しました')
    expect(page).to_not have_text('良いと思います')
  end
end
