post '/users/:id/tweets' do
	@tweets = Tweet.all
	@users = User.all
	@user = User.find(session[:user_id])
  @tweet = Tweet.create(user_id: session[:user_id], description: params[:tweet])
  erb :'/users/show'
end