class GithubRepo
  attr_reader :name, :description, :forks_count, :description, :language, 
              :updated, :stargazers_count, :stargazers_url, :url, :forks_url

  def initialize(attributes = {})
    @name              = attributes[:name]
    @description       = attributes[:description]
    @language          = attributes[:language]
    @updated           = attributes[:updated_at]
    @repo_url          = attributes[:url]
    @stargazers_count  = attributes[:stargazers_count]
    @stargazers_url    = attributes[:stargazers_url]
    @forks_count       = attributes[:forks_count]
    @forks_url         = attributes[:forks_url]
  end

  def self.get_repos(token)
    GithubService.new(token).repos.map do |raw_repo|
      GithubRepo.new(raw_repo)
    end
  end
end
