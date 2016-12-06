class Repo

  attr_reader :id, :name, :language, :url

  def initialize(attributes={})
    @id = attributes[:id]
    @name = attributes[:name]
    @language = attributes[:language]
    @url = attributes[:url]
  end

  def self.find_by_user(username)
    service = GithubService.new
    service.get_repos(username).map do |repo_info|
      Repo.new(repo_info)
    end
  end

end
