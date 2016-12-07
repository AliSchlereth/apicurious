class Organization

  attr_reader :name, :url, :img

  def initialize(attributes)
    @name = attributes[:login]
    @url = attributes[:url]
    @img = attributes[:avatar_url]
  end

  def self.by_user(token)
    service = GithubService.new(token)
    service.get_organizations.map do |org_info|
      Organization.new(org_info)
    end
  end

end
