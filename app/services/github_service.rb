class GithubService

  def initialize(token)
    @token = token
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:access_token] = token
    end
  end

  def get_repos
    response = @conn.get("/user/repos?sort=updated")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_user
    # response = Faraday.get("https://api.github.com/users/#{username}?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}")
    response = @conn.get("/user")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_followers
    response = @conn.get("/user/followers")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_following
    response = @conn.get("/user/following")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def find_unauthenticated_user(username)
    response = @conn.get("/users/#{username}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_starred
    response = @conn.get("/user/starred")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_events(username)
    response = @conn.get("/users/#{username}/events")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
