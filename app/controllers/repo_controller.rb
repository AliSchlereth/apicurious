class RepoController < ApplicationController

  def index
    @repos = Repo.find_by_user(current_user.username)
  end

end
