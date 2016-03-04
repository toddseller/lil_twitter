get '/users' do 
	@users = User.all
	@user = User.find(session[:user_id])
	erb :'users/index'
end

get '/users/new' do 
	erb :'users/new'
end

get '/users/:id/tweets' do
	@tweets = Tweet.all
	@user = User.find(params[:id]) 
	if @user.id != session[:user_id]
		redirect '/'
	else
		erb :'users/show'
	end
end

post '/users/new' do 
	@user = User.create(username: params[:username], password: params[:password], full_name: params[:full_name], email: params[:email])
	if @user.valid?
		redirect "/users"
	else
    	redirect "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
	end
end

# get '/users/:id/tweets' do 
# 	@tweets = Tweet.all
# 	@user = User.find(params[:id])
# 	erb :'users/show'
# end

post '/users/:id/tweets/new' do
	@user = User.find(session[:user_id])
  	@tweet = Tweet.create(user_id: session[:user_id], description: params[:tweet])
  	redirect "/users/#{@user.id}/tweets"
end


post '/followers' do 
	@follower = Follower.create(follower_id: session[:user_id], followee_id: params[:user_id])
	redirect "/users/#{session[:user_id]}"
end


