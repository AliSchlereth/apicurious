class FollowingController < ApplicationController

  def index
    @profile = Profile.find_user(current_user.token)
    @following = Profile.find_following(current_user.token)
  end

end
