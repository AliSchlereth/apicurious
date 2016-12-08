class HomeController < ApplicationController

  def index
    @events = Event.rcvd_by_user(current_user.token, current_user.username) if current_user
  end

end
