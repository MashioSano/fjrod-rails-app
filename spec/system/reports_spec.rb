require 'rails_helper'

RSpec.describe "Reports", type: :system do
  let(:tony) { FactoryBot.create(:tony_stark) }
  scenario "test case" do
    visit root_path
    login_user(tony.email, tony.password)
  end
end
