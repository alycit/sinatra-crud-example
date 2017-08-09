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

  redirect '/not_authorized' if current_user != @game.user
  erb :"games/edit"
end

put '/games/:id' do
  authenticate!

  @game = Game.find_by(id: params[:id])

  redirect '/not_authorized' if current_user != @game.user

  if @game.update_attributes(params[:game])
    redirect '/games'
  else
    erb :"games/edit"
  end
end

delete '/games/:id' do
  authenticate!

  @game = Game.find_by(id: params[:id])

  redirect '/not_authorized' if current_user != @game.user

  @game.destroy
  redirect '/games'
end

