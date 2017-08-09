get '/sessions/new' do
  erb :"session/new"
end

post '/sessions' do
  @user = User.find_by(username: params[:username])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @message = "Either you username or password was wrong"
    erb :"session/new"
  end

end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end

get '/not_authorized' do
  erb :not_authorized
end