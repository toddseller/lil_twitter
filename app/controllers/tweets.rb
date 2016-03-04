post '/tweets' do 
	@user = User.find(session[:user_id])
  	@tweet = Tweet.create(user_id: session[:user_id], description: params[:tweet])
  	redirect "/tweets"
end


get '/tweets' do
	@tweets = Tweet.all
	if session[:user_id] == nil
		redirect "/login"
	else
		erb :'tweets/index'
	end
end

delete '/tweets' do 
	@tweet = Tweet.find(params[:id])
	@tweet.destroy
	redirect '/tweets'
end
