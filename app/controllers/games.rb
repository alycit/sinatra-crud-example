get '/games' do
  @games = Game.all
  erb :"games/index"
end

get '/games/new' do
  @game = Game.new
  erb :"games/new"
end

post '/games' do
  @game = Game.new(params[:game])

  if @game.save
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
  @game = Game.find_by(id: params[:id])
  erb :"games/edit"
end

put '/games/:id' do
  @game = Game.find_by(id: params[:id])

  if @game.update_attributes(params[:game])
    redirect '/games'
  else
    erb :"games/edit"
  end
end

delete '/games/:id' do
  @game = Game.find_by(id: params[:id])
  @game.destroy
  redirect '/games'
end

