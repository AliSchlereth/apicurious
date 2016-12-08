module ApplicationHelper

  def organizations
     Organization.by_user(current_user.token)
  end

  def starred_count
    Repo.find_starred(current_user.token).count
  end

  def follower_count
    Profile.find_followers(current_user.token).count
  end

  def following_count
    Profile.find_following(current_user.token).count
  end

  def repo_count
    Repo.find_by_user(current_user.token).count
  end

end
