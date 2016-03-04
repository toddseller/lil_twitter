get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
	erb :login
end


post '/login' do 
	@user = User.find_by(username: params[:username])
	if @user.authenticate(params[:password])
	redirect "/users/#{@user.id}"
end
end 
