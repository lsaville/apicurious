require 'rails_helper'

describe 'GithubService' do
  before(:each) do
    @user = User.create(token: ENV['token'])
  end

  context '#repos' do
    it 'returns a collection of repositories', :vcr do
      repos = GithubService.new(@user.token).repos

      expect(repos.class).to eq(Array)
      expect(repos.first).to have_key(:name)
      expect(repos.first).to have_key(:description)
      expect(repos.first).to have_key(:language)
      expect(repos.first).to have_key(:updated_at)
    end
  end
end
