class Profile

  attr_reader :username,
              :name,
              :email,
              :joined_on,
              :location,
              :profile_pic,
              :followers,
              :following,
              :starred

  def initialize(attributes={})
    @username     = attributes[:username]
    @name         = attributes[:name]
    @email        = attributes[:email]
    @joined_on    = attributes[:created_at]
    @location     = attributes[:location]
    @profile_pic  = attributes[:avatar_url]
  end

  def self.find_user(token)
    service = GithubService.new(token)
    attributes = service.get_user
    Profile.new(attributes)
  end

end
