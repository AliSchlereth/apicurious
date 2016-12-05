class SessionsController < ApplicationController

  def create
    @response = Faraday.post("https://github.com/login/oauth/access_token?client_id=a166bd6a7fe6014dc5de&client_secret=192fd82509efdcf51ce1f534dff162608ebef363&code=#{params["code"]}")
    token = @response.body.split(/\W+/)[1]
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(oauth_response.body)
    user = User.find_or_create_by(uid: auth['id'])
    user.username     = auth['login']
    user.uid          = auth['id']
    user.token        = token
    user.profile_pic  = auth['avatar_url']
    user.name         = auth['name']
    user.joined_on    = auth['created_at']
    user.location     = auth['location']
    user.email        = auth['email']
    user.save

    session[:user_id] = user.id
    redirect_to dashboard_index_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
