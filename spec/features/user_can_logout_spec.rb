require 'rails_helper'

RSpec.describe 'User can logout' do
  context 'after logging in' do
    User.create(
      name: "Tracy",
      username: "Ycart",
      password: "michelle",
      password_confirmation: "michelle",
      role: 1
    )
    it 'user can logout' do
      visit login_path
      fill_in 'session[username]', with: "Ycart"
      fill_in 'session[password]', with: "michelle"
      click_link_or_button "Login"
      expect(page).to have_content("Welcome Tracy")
      click_link_or_button "Logout"
      expect(page).to_not have_content("Welcome Tracy")
    end
  end
end
