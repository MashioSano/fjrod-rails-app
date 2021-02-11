# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Followers', type: :system do
  let(:tony) { FactoryBot.create(:tony_stark, name: 'Tony Stark') }
  let(:steve) { FactoryBot.create(:steve_rogers, name: 'Steve Rogers') }
  let!(:relationship) { Relationship.create!(following: tony, follower: steve) }
  example 'フォロワーを一覧表示する' do
    visit users_path
    click_link 'Steve Rogers'
    click_link '1フォロワー'
    expect(page).to have_text('Tony Stark')
  end
end
