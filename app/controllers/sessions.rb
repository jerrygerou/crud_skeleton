get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["That user does not exist."]
    redirect '/sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil

  redirect '/sessions/new'
end

