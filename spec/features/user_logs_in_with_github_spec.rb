require 'rails_helper'

describe 'oauth login' do
  before(:each) do
    Capybara.app = Apicurious::Application
    stub_omniauth
  end

  context 'user with github credentials' do
    it 'logs you in when clicking login link and redirects to dashboard' do
      visit root_path

      click_link "Login with Github"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome to partytown")
      expect(page).to have_content("Logout")
    end
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      :uid => '12345',
      :info => {
        :name => 'Julio',
        :image => 'https://robohash.org/suuuuuper',
        :nickname => 'jdog'
      },
      :credentials => {
        :token => 'token'
      },
      :extra => {
        :raw_info => {
          :location => 'Denver, CO',
          :created_at => '2016-01-29T16:40:00Z'
        }
      }
    })
  end
end
