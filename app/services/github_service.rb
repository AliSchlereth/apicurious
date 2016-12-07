class GithubService

  def initialize(token)
    @token = token
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:access_token] = token
    end
  end

  def get_repos
    response = @conn.get("/user/repos")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_user
    # response = Faraday.get("https://api.github.com/users/#{username}?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}")
    response = @conn.get("/user")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
