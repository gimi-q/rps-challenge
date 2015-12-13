require 'sinatra/base'
require_relative 'player'
require_relative 'game'

class Rps < Sinatra::Base

  get '/' do
      erb :index
  end

  get '/players1' do
    erb :players1
  end

  get '/players2' do
    erb :players2
  end

  post '/names1' do
     player_1 = Player.new(params[:player_1_name])
     player_2 = Player.new("Computer")
     $game = Game.new(player_1, player_2)
     redirect '/play1'
   end

   post '/names2' do
     player_1 = Player.new(params[:player_1_name])
     player_2 = Player.new(params[:player_2_name])
     $game = Game.new(player_1, player_2)
     redirect '/play'
   end

   get '/play' do
    @game = $game
    @player1_name = @game.players[0].name
    @player2_name  = @game.players[1].name
    erb(:play)
  end

  get '/play1' do
    @game = $game
    @player1_name = @game.players[0].name
    @player2_name  = @game.players[1].name
    erb(:play1)
  end

end
