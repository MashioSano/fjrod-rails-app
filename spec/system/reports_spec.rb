require 'rails_helper'

RSpec.describe "Reports", type: :system do
  let(:tony) { FactoryBot.create(:tony_stark) }
  let!(:report) { FactoryBot.create(:report, user: tony) }
  scenario "index reports" do
    visit root_path
    click_link '日報一覧'
    assert_text '日報一覧'
    assert_text '初日報'
  end

  scenario 'show report' do
    visit reports_path
    click_link report.title
    assert_text '初日報'
    assert_text '初めての日報のです これから頑張ります'
  end

  scenario 'create report' do
    login_user(tony.email, tony.password)
    visit reports_path
    click_link '日報を作成'
    fill_in 'タイトル', with: 'やる気が出ませんでした'
    fill_in '本文', with: '何もしませんでした'
    expect { click_button '登録する' }.to change { tony.reports.count }.by(1)
    assert_text '作成しました'
  end

  scenario 'update report' do
    login_user(tony.email, tony.password)
    visit report_path(report)
    click_link '日報を編集'
    fill_in 'タイトル', with: '初日ですがやめます'
    fill_in '本文', with: '退会します!!'
    click_button '更新する'
    assert_text '更新しました'
    assert_text '初日ですがやめます'
  end

  scenario 'delete report' do
    login_user(tony.email, tony.password)
    visit report_path(report)
    expect { click_link '日報を削除' }.to change { tony.reports.count }.by(-1)
    assert_text '削除しました'
  end
end
