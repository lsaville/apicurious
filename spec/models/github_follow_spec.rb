require 'rails_helper'

describe GithubFollow do
  context '#get_followers' do
    it 'returns a collection of followers that have basic info', :vcr do
      followers = GithubFollow.get_followers(ENV['token'])
      follow = followers.first

      expect(followers).to be_an(Array)
      expect(follow).to be_a(GithubFollow)
      expect(follow).to respond_to(:login)
      expect(follow).to respond_to(:name)
      expect(follow).to respond_to(:image)
      expect(follow).to respond_to(:url)
      expect(follow).to respond_to(:company)
      expect(follow).to respond_to(:bio)
      expect(follow).to respond_to(:location)
    end
  end

  context '#get_following' do
    it 'returns a collection of people following a user', :vcr do
      following = GithubFollow.get_following(ENV['token'])
      follow = following.first
      
      expect(following).to be_an(Array)
      expect(follow).to be_a(GithubFollow)
      expect(follow).to respond_to(:login)
      expect(follow).to respond_to(:name)
      expect(follow).to respond_to(:image)
      expect(follow).to respond_to(:url)
      expect(follow).to respond_to(:company)
      expect(follow).to respond_to(:location)
    end
  end
end
