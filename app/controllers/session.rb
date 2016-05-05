get '/login' do
  erb :"session/new"
end

post '/login' do
  @user = User.find_by(username: params[:username])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @message = "Either you username or password was wrong"
    erb :"session/new"
  end

end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end