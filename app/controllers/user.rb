get '/users' do 
	@users = User.all
	@user = User.find(session[:user_id])
	erb :'users/index'
end

get '/users/new' do 
	erb :'users/new'
end

get '/users/:id' do 
	@user = User.find(params[:id])
	@tweets = @user.tweets
	erb :'users/show'
end

post '/users' do 
	@user = User.create(username: params[:username], password: params[:password], full_name: params[:full_name], email: params[:email])
	if @user.valid?
		session[:user_id] = @user.id
		redirect "/users"
	else
    	redirect "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
	end
end


post '/followers' do
	@user = User.find(session[:user_id])
	@follower = Follower.create(follower_id: session[:user_id], followee_id: params[:user_id])
	redirect "/users/#{params[:user_id]}"
end

delete '/followers' do 
	@follower = Follower.find(follower_id: params[:user_id])
	@follower.destroy
	redirect "/users/#{params[:user_id]}"
end

post '/users/tweets' do 
  @user = User.find_by(username: params[:username])
  @tweets = @user.tweets
  erb :'users/show'
end

