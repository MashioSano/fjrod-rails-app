# frozen_string_literal: true

module LoginHelper
  def login_user(email, password)
    visit new_user_session_path
    within 'form[name=sign_in]' do
      fill_in 'Eメール', with: email
      fill_in 'パスワード', with: password
      click_button 'ログイン'
    end
  end
end
