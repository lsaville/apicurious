class GithubService
  def repositories
    response = Faraday.get("https://api.github.com/user/repos?access_token=#{ENV['token']}&affiliation=owner")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end
end
