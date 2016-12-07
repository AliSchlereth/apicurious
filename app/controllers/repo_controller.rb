class RepoController < ApplicationController

  def index
    @profile = Profile.find_user(current_user.token)
    @repos = Repo.find_by_user(current_user.token)
  end

end
