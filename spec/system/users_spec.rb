# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:tony) { FactoryBot.create(:user, name: 'Tony Stark') }
  example 'ユーザーの一覧を表示する' do
    visit root_path
    click_link 'ユーザー一覧'
    expect(page).to have_text('ユーザー一覧')
    expect(page).to have_text('Tony Stark')
  end

  example 'ユーザーの詳細を表示する' do
    visit users_path
    click_link 'Tony Stark'
    expect(page).to have_text('ユーザーの詳細')
    expect(page).to have_text('Tony Stark')
  end
end
