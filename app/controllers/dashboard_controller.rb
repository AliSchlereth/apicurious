class DashboardController < ApplicationController

  def index
    @profile = Profile.find_user(current_user.token)
  end

end
