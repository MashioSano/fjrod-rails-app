# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Relationships', type: :system, js: true do
  let!(:tony) { FactoryBot.create(:tony_stark, name: 'Tony Stark', email: 'tonystark@example.com') }
  let!(:steve) { FactoryBot.create(:steve_rogers, name: 'Steve Rogers', email: 'steverogers@example.com') }
  let!(:relationship) { Relationship.create!(following: tony, follower: steve) }

  scenario 'フォローする' do
    login_user('steverogers@example.com', 'password')
    visit users_path
    click_link 'Tony Stark'
    expect do
      click_button 'フォロー'
      expect(page).to have_css('.unfollow-btn')
    end.to change { steve.active_relationships.count }.by(1)
  end

  scenario 'フォローを外す' do
    login_user('tonystark@example.com', 'password')
    visit users_path
    click_link 'Steve Rogers'
    expect do
      click_button 'フォローを解除'
      expect(page).to have_css('.follow-btn')
    end.to change { tony.active_relationships.count }.by(-1)
  end
end
