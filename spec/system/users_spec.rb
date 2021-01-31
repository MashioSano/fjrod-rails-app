# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:tony) { FactoryBot.create(:tony_stark) }
  scenario 'index users' do
    visit root_path
    click_link 'ユーザー一覧'
    assert_text 'ユーザー一覧'
    expect(page).to have_text('Tony Stark')
  end

  scenario 'show user' do
    visit users_path
    click_link tony.name
    expect(page).to have_text('Tony Stark')
  end
end
