require './lib/player'
require './lib/game'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567
# rackup -p 4567

class Battle < Sinatra::Base

  DEFAULT_HP = 100
  DEFAULT_DAMAGE = 10

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name], DEFAULT_HP)
    player_2 = Player.new(params[:player_2_name], DEFAULT_HP)
    $game = Game.new(player_1, player_2)
    redirect to('/play')
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    $game.turn_attack(DEFAULT_DAMAGE)
    erb(:attack)
  end

  run! if app_file == $0
end