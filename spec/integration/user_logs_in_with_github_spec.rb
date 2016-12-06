require 'rails_helper'

describe 'oauth login' do
  context 'user with github credentials' do
    it 'logs you in when clicking login link and redirects to dashboard' do
      login_with_omniauth

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome to partytown")
      expect(page).to have_content("Logout")
    end
  end
end
