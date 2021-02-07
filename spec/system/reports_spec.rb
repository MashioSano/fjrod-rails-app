# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reports', type: :system do
  let(:tony) { FactoryBot.create(:tony_stark, name: 'Tony Stark', email: 'tony@example.com') }
  let!(:report) { FactoryBot.create(:report, user: tony, title: '初日報', body: '初めての日報です これから頑張ります') }
  example '日報の一覧を表示する' do
    visit root_path
    click_link '日報一覧'
    expect(page).to have_text('日報一覧')
    expect(page).to have_text('初日報')
  end

  example '日報の詳細を表示する' do
    visit reports_path
    click_link '初日報'
    expect(page).to have_text('初日報')
    expect(page).to have_text('初めての日報です これから頑張ります')
  end

  example '日報を作成する' do
    login_user('tony@example.com', 'password')
    visit reports_path
    click_link '日報を作成'
    fill_in 'タイトル', with: 'やる気が出ませんでした'
    fill_in '本文', with: '何もしませんでした'
    click_button '登録する'
    expect(page).to have_text('作成しました')
    expect(page).to have_text('やる気が出ませんでした')
  end

  example '日報を更新する' do
    login_user('tony@example.com', 'password')
    visit report_path(report)
    click_link '日報を編集'
    fill_in 'タイトル', with: '初日ですがやめます'
    fill_in '本文', with: '退会します!!'
    click_button '更新する'
    expect(page).to have_text('更新しました')
    expect(page).to have_text('初日ですがやめます')
  end

  example '日報を削除する' do
    login_user('tony@example.com', 'password')
    visit report_path(report)
    expect(page).to have_text('初日報')
    click_link '日報を削除'
    expect(page).to have_text('削除しました')
    expect(page).to_not have_text('初日報')
  end
end
