post '/tweets' do 
	@user = User.find(session[:user_id])
  	@tweet = Tweet.create(user_id: session[:user_id], description: params[:tweet])
  	redirect "/tweets"
end


get '/tweets' do
	@tweets = Tweet.all
	erb :'tweets/index'
end

