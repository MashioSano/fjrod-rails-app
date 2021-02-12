# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Relationships', type: :system, js: true do
  let!(:tony) { FactoryBot.create(:user, name: 'Tony Stark', email: 'tony@example.com') }
  let!(:steve) { FactoryBot.create(:user, name: 'Steve Rogers', email: 'steve@example.com') }
  let!(:relationship) { Relationship.create!(following: tony, follower: steve) }

  example 'フォローする' do
    login_user('steve@example.com', 'password')
    visit users_path
    click_link 'Tony Stark'
    expect do
      click_button 'フォロー'
      expect(page).to have_css('.unfollow-btn')
    end.to change { steve.active_relationships.count }.by(1)
  end

  example 'フォローをはずす' do
    login_user('tony@example.com', 'password')
    visit users_path
    click_link 'Steve Rogers'
    expect do
      click_button 'フォローを解除'
      expect(page).to have_css('.follow-btn')
    end.to change { tony.active_relationships.count }.by(-1)
  end
end
