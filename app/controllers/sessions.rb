get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
    erb :'users/show'
  else
    @errors = ["Invalid username and/or password."]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil

  redirect '/'
end

