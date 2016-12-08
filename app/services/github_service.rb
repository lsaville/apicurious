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
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    users_from_login(parsed_response)
  end

  def following
    response = conn.get "user/following" 
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    users_from_login(parsed_response)
  end

  def users_from_login(follows)
    follows.map do |follow|
      response = conn.get "users/#{follow[:login]}"
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  private

    attr_reader :conn
end
