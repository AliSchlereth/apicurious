class Repo

  attr_reader :id, :name, :language, :url, :updated_at

  def initialize(attributes={})
    @id = attributes[:id]
    @name = attributes[:name]
    @language = attributes[:language]
    @url = attributes[:url]
    @updated_at = attributes[:updated_at]
  end

  def self.find_by_user(username)
    service = GithubService.new
    service.get_repos(username).map do |repo_info|
      Repo.new(repo_info)
    end
  end

end
