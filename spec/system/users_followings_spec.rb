# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Followings', type: :system do
  let(:tony) { FactoryBot.create(:tony_stark) }
  let(:steve) { FactoryBot.create(:steve_rogers) }
  let!(:relationship) { Relationship.create(following: tony, follower: steve) }
  scenario 'index follwings' do
    visit users_path
    click_link tony.name
    click_link '1フォロー'
    expect(page).to have_text('steve Rogers')
  end
end
