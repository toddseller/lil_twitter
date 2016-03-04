post '/tweets' do
	@user = User.find(session[:user_id])
  	@tweet = Tweet.create(user_id: session[:user_id], description: params[:tweet])
    @favorite = Favorite.create(count: 0, tweet_id: session[:user_id])
  	redirect "/tweets"
end


get '/tweets' do
	@tweets = Tweet.all
	erb :'tweets/index'
end

