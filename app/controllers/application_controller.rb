class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
  	if session[:user]
  	 	#what if can't find session's user
      @user = User.find_by_user_id(session[:user])
      @access_token = @user.access_token
     #elsif for android app
    else
      request = params[:signed_request]
      @oauth = Koala::Facebook::OAuth.new(wall_posts_url)
      data = @oauth.parse_signed_request(request)
      @access_token = data["oauth_token"]
      @user = User.load_user(data)
      session[:user] = @user.user_id
      return redirect_to @oauth.url_for_oauth_code(:permissions => "publish_stream")
    end
  end

end
