require 'rails_helper'

describe GithubUser do
  context '#user_data' do
    it 'has all the data for a user', :vcr do
      me = GithubUser.get_user_data(ENV['token'])

      expect(me).to be_a(GithubUser)
      expect(me).to respond_to(:image)
      expect(me).to respond_to(:name)
      expect(me).to respond_to(:login)
      expect(me).to respond_to(:company)
      expect(me).to respond_to(:location)
      expect(me).to respond_to(:email)
      expect(me).to respond_to(:blog)
      expect(me).to respond_to(:joined)
    end
  end
end
