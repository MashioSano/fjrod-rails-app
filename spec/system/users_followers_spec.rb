# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Followers', type: :system do
  let(:tony) { FactoryBot.create(:tony_stark) }
  let(:steave) { FactoryBot.create(:steave_rogers) }
  let!(:relationship) { Relationship.create(following: tony, follower: steave) }
  scenario 'index follwers' do
    visit users_path
    click_link steave.name
    click_link '1フォロワー'
    assert_text 'Tony Stark'
  end
end
