get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :"users/show"
end