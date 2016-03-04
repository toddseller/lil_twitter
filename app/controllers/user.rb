get '/users' do 
	@users = User.all
end

get '/users/new' do 
	erb :'users/new'
end

get '/users/:id' do 
	erb :'users/index'
end


post '/users/' do 
	@user = User.create(username: params[:username], password: params[:password], full_name: params[:full_name], email: params[:email])
	redirect "/users/#{@user.id}"
end