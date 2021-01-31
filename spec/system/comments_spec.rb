# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  let(:tony) { FactoryBot.create(:tony_stark) }
  let!(:report) { FactoryBot.create(:report, user: tony) }
  let!(:comment) { Comment.create(description: '良いと思います', user: tony, commentable: report) }
  scenario 'index comments' do
    visit report_path(report)
    click_link 'コメント一覧'
    expect(page).to have_text('コメント一覧')
    expect(page).to have_text('良いと思います')
  end

  scenario 'show comment' do
    visit report_comments_path(report)
    click_link comment.description
    expect(page).to have_text('コメント詳細')
    expect(page).to have_text('良いと思います')
  end

  scenario 'create comment' do
    login_user(tony.email, tony.password)
    visit report_comments_path(report)
    click_link 'コメントを作成'
    fill_in '説明文', with: 'LGTMです'
    expect do
      click_button '登録する'
    end.to change { report.comments.count }.by(1)
    expect(page).to have_text('作成しました')
  end

  scenario 'update comment' do
    login_user(tony.email, tony.password)
    visit report_comment_path(report, comment)
    click_link 'コメントを編集'
    fill_in '説明文', with: 'メンターの佐野です  よろしくお願いします'
    click_button '更新する'
    expect(page).to have_text('更新しました')
  end

  scenario 'delete comment' do
    login_user(tony.email, tony.password)
    visit report_comment_path(report, comment)
    expect { click_link 'コメントを削除' }.to change { report.comments.count }.by(-1)
    expect(page).to have_text('削除しました')
  end
end
