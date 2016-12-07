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
    @username     = attributes[:login]
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

  def self.find_followers(token)
    service = GithubService.new(token)
    followers = service.get_followers
    followers.map do |follower|
      follower_details = service.find_unauthenticated_user(follower[:login])
      Profile.new(follower_details)
    end
  end

  def self.find_following(token)
    service = GithubService.new(token)
    followers = service.get_following
    followers.map do |follower|
      follower_details = service.find_unauthenticated_user(follower[:login])
      Profile.new(follower_details)
    end
  end



end
