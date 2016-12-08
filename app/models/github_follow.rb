class GithubFollow
  attr_reader :login, :image, :url, :company, :bio, :name, :location
  def initialize(attributes={})
    @login    = attributes[:login]
    @image    = attributes[:avatar_url]
    @url      = attributes[:url]
    @company  = attributes[:company]
    @bio      = attributes[:bio]
    @name     = attributes[:name]
    @location = attributes[:location]
  end

  def self.get_followers(token)
    GithubService.new(token).followers.map do |raw_repo|
      GithubFollow.new(raw_repo)
    end
  end

  def self.get_following(token)
    GithubService.new(token).following.map do |raw_repo|
      GithubFollow.new(raw_repo)
    end
  end
end
