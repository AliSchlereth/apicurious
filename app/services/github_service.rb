class GithubService

  def get_repos(username)
    response = Faraday.get("https://api.github.com/users/#{username}/repos")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
