get '/users' do 
	@users = User.all
end

get '/users/new' do 
	erb :'users/new'
end

get '/users/:id' do
	@user = User.find(params[:id]) 
	@users = User.all
	if @user.id != session[:user_id]
		redirect '/'
	else
		erb :'users/index'
	end
end


post '/users/new' do 
	@user = User.create(username: params[:username], password: params[:password], full_name: params[:full_name], email: params[:email])
	if @user.valid?
		redirect "/users/#{@user.id}"
	else
    	redirect "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
	end
end

get '/users/show' do
	redirect "users/#{@user.id}/tweets"
end


get '/users/:id/tweets' do 
	@tweets = Tweet.all
	@user = User.find(params[:id])
	erb :'users/show'
end

post '/users/:id/tweets' do
	@user = User.find(session[:user_id])
  	@tweet = Tweet.create(user_id: session[:user_id], description: params[:tweet])
  	redirect "users/#{@user.id}/tweets"
end


