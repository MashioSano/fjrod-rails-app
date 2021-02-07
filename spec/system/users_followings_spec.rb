# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users Followings', type: :system do
  let(:tony) { FactoryBot.create(:tony_stark, name: 'Tony Stark') }
  let(:steve) { FactoryBot.create(:steve_rogers, name: 'Steve Rogers') }
  let!(:relationship) { Relationship.create(following: tony, follower: steve) }
  example 'フォロー中のユーザーを一覧表示する' do
    visit users_path
    click_link 'Tony Stark'
    click_link '1フォロー'
    expect(page).to have_text('Steve Rogers')
  end
end
