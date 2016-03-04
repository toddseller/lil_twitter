get '/users' do 
	@users = User.all
	@user = User.find(session[:user_id])
	erb :'users/index'
end

get '/users/new' do 
	erb :'users/new', layout: false
end


post '/users/new' do 
	@user = User.create(username: params[:username], password: params[:password], full_name: params[:full_name], email: params[:email])
	if @user.valid?
		redirect "/users"
	else
    	redirect "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
	end
end

post '/followers' do 
	@follower = Follower.create(follower_id: session[:user_id], followee_id: params[:user_id])
	redirect "/users/#{params[:user_id]}"
	#redirects to the person you're following's page instead of the home page. 
end

get '/users/:id' do 
	@user = User.find(params[:id])
	@tweets = @user.tweets
	erb :'users/show'
end


