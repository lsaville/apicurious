require 'rails_helper'

describe 'GithubService' do
  context '#repos' do
    it 'returns a collection of repositories', :vcr do
      repos = GithubService.new(ENV['token']).repos

      expect(repos.class).to eq(Array)
      expect(repos.first).to have_key(:name)
      expect(repos.first).to have_key(:description)
      expect(repos.first).to have_key(:language)
      expect(repos.first).to have_key(:updated_at)
    end
  end

  context '#starred' do
    it 'returns a collection of starred repositories', :vcr do
      repos = GithubService.new(ENV['token']).starred
      repo = repos.first

      expect(repos).to be_an(Array)
      expect(repo).to have_key(:name)
      expect(repo).to have_key(:url)
      expect(repo).to have_key(:language)
      expect(repo).to have_key(:description)
    end
  end

  context '#followers' do
    it 'returns a collection of followers', :vcr do
      followers = GithubService.new(ENV['token']).followers
      follower = followers.first

      expect(followers).to be_an(Array)
      expect(follower).to have_key(:login)
    end
  end

  context '#following' do
    it 'returns a collection of those the user is following', :vcr do
      people_followed = GithubService.new(ENV['token']).following
      one_followed = people_followed.first

      expect(people_followed).to be_an(Array)
      expect(one_followed).to have_key(:login)
    end
  end
end
