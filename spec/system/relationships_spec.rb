# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Relationships', type: :system, js: true do
  let(:tony) { FactoryBot.create(:tony_stark) }
  let(:steave) { FactoryBot.create(:steave_rogers) }
  let!(:relationship) { Relationship.create(following: tony, follower: steave) }

  scenario 'create relationship' do
    login_user(steave.email, steave.password)
    visit users_path
    click_link tony.name
    expect do
      click_button 'フォロー'
      expect(page).to have_css('.unfollow-btn')
    end.to change { steave.active_relationships.count }.by(1)
  end

  scenario 'delete relationship' do
    login_user(tony.email, tony.password)
    visit users_path
    click_link steave.name
    expect do
      click_button 'フォローを解除'
      expect(page).to have_css('.follow-btn')
    end.to change { tony.active_relationships.count }.by(-1)
  end
end
