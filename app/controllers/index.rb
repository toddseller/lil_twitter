get '/' do
  erb :index, layout: false
end

get '/login' do
	erb :login
end

post '/login' do 
	@user = User.find_by(username: params[:username])
	if @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	end
end
 
get '/logout' do
  session.delete(:user_id)

  redirect '/'
end