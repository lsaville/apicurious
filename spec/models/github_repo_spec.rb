require 'rails_helper'

describe GithubRepo do
  context '#get_repos' do
    it 'returns an array of githubrepo objects', :vcr do
      repos = GithubRepo.get_repos(ENV['token'])
      repo = repos.first

      expect(repos).to be_an(Array)
      expect(repo).to be_a(GithubRepo)
      expect(repo).to respond_to(:forks_count)
      expect(repo).to respond_to(:description)
      expect(repo).to respond_to(:name)
      expect(repo).to respond_to(:language)
      expect(repo).to respond_to(:updated)
      expect(repo).to respond_to(:forks_url)
      expect(repo).to respond_to(:stargazers_count)
      expect(repo).to respond_to(:stargazers_url)
      expect(repo).to respond_to(:url)
    end
  end
end
