get '/games' do
  @games = Game.all
  erb :"games/index"
end

get '/games/new' do
  authenticate!
  @game = Game.new
  erb :"games/new"
end

post '/games' do
  authenticate!
  @game = Game.new(params[:game])

  if @game.save
    current_user.games << @game
    redirect '/games'
  else
    @errors = @game.errors.full_messages
    erb :"games/new"
  end
end

get '/games/:id' do
  @game = Game.find_by(id: params[:id])
  erb :"games/show"
end

get '/games/:id/edit' do
  authenticate!
  @game = Game.find_by(id: params[:id])
  authorize!(@game.user)
  erb :"games/edit"
end

put '/games/:id' do
  authenticate!
  @game = Game.find_by(id: params[:id])
  authorize!(@game.user)

  if @game.update(params[:game])
    redirect '/games'
  else
    @errors = @game.errors.full_messages
    erb :"games/edit"
  end
end

delete '/games/:id' do
  authenticate!
  @game = Game.find_by(id: params[:id])
  authorize!(@game.user)
  @game.destroy
  redirect '/games'
end

