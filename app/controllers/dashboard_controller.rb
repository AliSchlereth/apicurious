class DashboardController < ApplicationController

  def index
    @profile = Profile.find_user(current_user.username)
  end

end
