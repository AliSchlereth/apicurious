class RepoController < ApplicationController

  def index
    @profile = Profile.find_user(current_user.username)
    @repos = Repo.find_by_user(current_user.username)
  end

end
