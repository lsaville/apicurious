class GithubService
  def initialize(token)
    @conn = Faraday.new(url: "https://api.github.com/") do |faraday|
              faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
              faraday.params[:access_token] = token
            end
  end

  def repos
    response = conn.get "user/repos", { affiliation: 'owner' } 
    JSON.parse(response.body, symbolize_names: true)
  end

  def starred
    response = conn.get "user/starred"
    JSON.parse(response.body, symbolize_names: true)
  end

  def followers
    response = conn.get "user/followers"
    JSON.parse(response.body, symbolize_names: true)
  end

  def following
    response = conn.get "user/following" 
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    attr_reader :conn
end
