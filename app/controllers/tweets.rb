post '/tweets' do
	@user = User.find(session[:user_id])
  	@tweet = Tweet.create(user_id: session[:user_id], description: params[:tweet])
    @favorite = Favorite.create(count: 0, tweet_id: session[:user_id])
  	redirect "/tweets"
end


get '/tweets' do
	if session[:user_id] == nil
		redirect "/login"
	@user = User.find(session[:user_id])
	@tweets = Tweet.all
	else
		erb :'tweets/index'
	end
end

delete '/tweets' do 
	@tweet = Tweet.find(params[:id])
	@tweet.destroy
	redirect '/tweets'
end
