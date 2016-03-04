post '/tweets' do
  @tweet = Tweet.new(user_id: session[:user_id], description: params[:tweet])
  erb :'/users/index'
end