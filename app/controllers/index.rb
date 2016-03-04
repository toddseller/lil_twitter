get '/' do
  erb :index
end

get '/login' do
	erb :index
end

post '/login' do 
	@user = User.find_by(username: params[:username])
	if @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect "/users"
	else
		redirect "/login"
	end
end
 
delete '/logout' do
  session.delete(:user_id)
  redirect '/'
end


get '/homepage' do 
	@user = User.find(session[:user_id])
	@followees  = @user.followees
	@tweets = @user.tweets
	@followee_tweets = Tweet.where(user_id: @followees.map(&:id))
	erb :'homepage'
end