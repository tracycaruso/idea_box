require 'rails_helper'

RSpec.describe 'Can Create User' do
  context 'with valid credentials' do
    it 'can create a user' do
      visit new_user_path
      fill_in 'user[name]', with: "Tracy"
      fill_in 'user[username]', with: "Ycart"
      fill_in 'user[password]', with: "michelle"
      fill_in 'user[password_confirmation]', with: "michelle"
      click_link_or_button "Create User"
      expect(page).to have_content("Welcome Tracy")
    end
  end
end
