get '/users/new' do
 erb :'users/new'
end

post '/users' do
  return redirect '/' if logged_in?
  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
 
  @user = User.find(params[:id])
  
  if @user.id == current_user.id
    erb :'users/show'
  else
    redirect '/'
  end

end