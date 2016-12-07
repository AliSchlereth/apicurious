class StarredController < ApplicationController

  def index
    @starred = Repo.find_starred(current_user.token)
    @profile = Profile.find_user(current_user.token)
  end

end
