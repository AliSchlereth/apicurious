class Profile

  attr_reader :name,
              :email,
              :joined_on,
              :location,
              :profile_pic,
              :followers,
              :following,
              :starred

  def initialize(attributes={})
    @name         = attributes[:name]
    @email        = attributes[:email]
    @joined_on    = attributes[:created_at]
    @location     = attributes[:location]
    @profile_pic  = attributes[:avatar_url]
  end

  def self.find_user(username)
    service = GithubService.new
    attributes = service.get_user(username)
    Profile.new(attributes)
  end

end
