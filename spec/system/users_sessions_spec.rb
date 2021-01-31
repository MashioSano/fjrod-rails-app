# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Sessions', type: :system do
  let(:tony) { FactoryBot.create(:tony_stark) }

  scenario 'create session' do
    visit root_path
    click_link 'ログイン'
    fill_in 'Eメール', with: tony.email
    fill_in 'パスワード', with: tony.password
    click_button 'ログイン'
    expect(page).to have_text('ログインしました')
  end

  scenario 'delete session' do
    login_user(tony.email, tony.password)
    click_link 'ログアウト'
    expect(page).to have_text('ログアウトしました')
  end
end
