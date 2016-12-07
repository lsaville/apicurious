require 'rails_helper'

describe 'GithubService' do
  context '#repositories' do
    it 'returns a collection of repositories' do
      repos = GithubService.new.repositories

      expect(repos.class).to eq(Array)
      expect(repos.count).to eq(35)
      expect(repos.first).to have_key(:name)
      expect(repos.first).to have_key(:id)
    end
  end
end
