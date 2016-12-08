class FollowersController < ApplicationController

  def index
    @profile = Profile.find_user(current_user.token)
    @followers = Profile.find_followers(current_user.token)
  end

end
