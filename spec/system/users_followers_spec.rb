# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Followers', type: :system do
  let(:tony) { FactoryBot.create(:tony_stark) }
  let(:steve) { FactoryBot.create(:steve_rogers) }
  let!(:relationship) { Relationship.create(following: tony, follower: steve) }
  example 'index follwers' do
    visit users_path
    click_link steve.name
    click_link '1フォロワー'
    expect(page).to have_text('Tony Stark')
  end
end
