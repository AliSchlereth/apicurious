class Repo

  attr_reader :id, :name, :language, :url, :updated_at

  def initialize(attributes={})
    @id = attributes[:id]
    @name = attributes[:name]
    @language = attributes[:language]
    @url = attributes[:url]
    @updated_at = attributes[:updated_at]
  end

  def self.find_by_user(token)
    service = GithubService.new(token)
    repos = service.get_repos.map do |repo_info|
      Repo.new(repo_info)
    end
    repos.sort! { |a,b| b.updated_at <=> a.updated_at }
  end

end
