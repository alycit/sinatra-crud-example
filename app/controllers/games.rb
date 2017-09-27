get '/games' do
  @games = Game.all
  erb :"games/index"
end

get '/games/new' do
  authenticate!

  @game = Game.new

  if request.xhr?
    erb :"/games/_form", layout: false, locals: {errors: nil, game: @game}
  else
    erb :"games/new"
  end
end

post '/games' do
  authenticate!

  @game = Game.new(params[:game])

  sleep 3
  if request.xhr?
    if @game.save
      current_user.games << @game
      erb :"/games/_game", locals: {game: @game}, layout: false
    else
      status 422
      body "Something bad happened"
    end
  else
    if @game.save
      current_user.games << @game
      redirect '/games'
    else
      @errors = @game.errors.full_messages
      erb :"games/new"
    end
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

