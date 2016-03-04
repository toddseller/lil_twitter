post '/tweets' do
  @tweet = Tweet.new(user_id: sessions[:user_id], description: params[:tweet])
  erb :'/users/index'
end