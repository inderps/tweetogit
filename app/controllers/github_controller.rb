class GithubController < ApplicationController
  skip_before_filter :load_token

  def authorize
    redirect_to("https://github.com/login/oauth/authorize?client_id=3ec34cfe2117b84317ae&redirect_uri=http://localhost:3001/github/callback&state=random123456")
  end

  def callback
    token = Github::User.token params[:code]
    github_user = Github::User.me(token)
    user = User.find_or_create_by_github_id_and_github_login(:github_id => github_user.id, :github_login => github_user.login)
    session[:token] = token
    session[:user] = user
    redirect_to(session[:redirect_url])
  end
end
